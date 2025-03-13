import 'package:env/env.dart';
import 'package:powersync/powersync.dart';
import 'package:shared/shared.dart' as shared;
import 'package:supabase_flutter/supabase_flutter.dart';

/// Postgres Response codes that we cannot recover from by retrying.
final List<RegExp> fatalResponseCodes = [
  // Class 22 — Data Exception
  // Examples include data type mismatch.
  RegExp(r'^22...$'),
  // Class 23 — Integrity Constraint Violation.
  // Examples include NOT NULL, FOREIGN KEY and UNIQUE violations.
  RegExp(r'^23...$'),
  // INSUFFICIENT PRIVILEGE - typically a row-level security violation
  RegExp(r'^42501$'),
];

/// {@template supabase_connector}
/// Connects to PowerSync using the Supabase auth token.
/// Periodically uploads data to the Supabase database
/// {@endtemplate}
class SupabaseConnector extends PowerSyncBackendConnector {
  /// {@macro supabase_connector}
  SupabaseConnector(this.db, {required this.env});

  /// A PowerSync managed database
  final PowerSyncDatabase db;

  /// Provides access to environment variables
  final EnvValue env;

  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    // Get current session from Supabase
    final session = Supabase.instance.client.auth.currentSession;
    shared.logD('Session: ${session?.user.toJson()}');

    // Not logged in
    if (session == null) return null;

    // Authenticate with PowerSync using access token
    final token = session.accessToken;
    final userId = session.user.id;
    final expiresAt = session.expiresAt == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(session.expiresAt! * 1000);

    return PowerSyncCredentials(
      endpoint: env(Env.powerSyncUrl),
      token: token,
      userId: userId,
      expiresAt: expiresAt,
    );
  }

  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    // This function is called whenever there is data to upload, whether the
    // device is online or offline.
    // If this call throws an error, it is retried periodically.
    final transaction = await database.getNextCrudTransaction();
    if (transaction == null) {
      return;
    }

    final rest = Supabase.instance.client.rest;
    CrudEntry? lastOp;
    try {
      for (final op in transaction.crud) {
        lastOp = op;

        final table = rest.from(op.table);
        if (op.op == UpdateType.put) {
          final data = Map<String, dynamic>.of(op.opData!);
          data['id'] = op.id;
          await table.upsert(data);
        } else if (op.op == UpdateType.patch) {
          await table.update(op.opData!).eq('id', op.id);
        } else if (op.op == UpdateType.delete) {
          await table.delete().eq('id', op.id);
        }
      }
    } on PostgrestException catch (e) {
      if (e.code != null &&
          fatalResponseCodes.any((re) => re.hasMatch(e.code!))) {
        /// Instead of blocking the queue with these errors,
        /// discard the (rest of the) transaction.
        ///
        /// Note that these errors typically indicate a bug in the application.
        /// If protecting against data loss is important, save the failing
        /// records
        /// elsewhere instead of discarding, and/or notify the user.
        shared.logE('Data upload error - discarding $lastOp', error: e);
        await transaction.complete();
      } else {
        /// Error may be retryable - e.g. network error or temporary server
        /// error. Throwing an error here causes this call to be retried after
        /// a delay.
        rethrow;
      }
    }
  }
}
