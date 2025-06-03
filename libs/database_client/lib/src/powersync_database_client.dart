import 'package:database_client/database_client.dart';
import 'package:powersync_repository/powersync_repository.dart';

/// {@template powersync_database_client}
/// A PowerSync implementation of the [DatabaseClient]
/// {@endtemplate}
class PowersyncDatabaseClient extends DatabaseClient {
  /// {@macro powersync_database_client}
  PowersyncDatabaseClient({required PowersyncRepository powersyncRepository})
      : _powersyncRepository = powersyncRepository;

  final PowersyncRepository _powersyncRepository;

  @override
  String? get currentUserId =>
      _powersyncRepository.supabase.auth.currentSession?.user.id;
}
