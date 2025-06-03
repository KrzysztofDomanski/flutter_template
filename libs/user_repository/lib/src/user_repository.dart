import 'package:database_client/database_client.dart';

/// {@template user_repository}
/// A repository for managing the current user
/// {@endtemplate}
class UserRepository implements UserBaseRepository {
  /// {@macro user_repository}
  const UserRepository({required PowersyncDatabaseClient databaseClient})
      : _databaseClient = databaseClient;

  final PowersyncDatabaseClient _databaseClient;

  @override
  String? get currentUserId => _databaseClient.currentUserId;
}
