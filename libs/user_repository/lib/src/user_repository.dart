import 'package:auth_client/auth_client.dart';
import 'package:database_client/database_client.dart';
import 'package:user_repository/src/models/models.dart';

/// {@template user_repository}
/// A repository for managing the current user
/// {@endtemplate}
class UserRepository implements UserBaseRepository {
  /// {@macro user_repository}
  const UserRepository({
    required PowersyncDatabaseClient databaseClient,
    required AuthClient authClient,
  })  : _databaseClient = databaseClient,
        _authClient = authClient;

  final PowersyncDatabaseClient _databaseClient;
  final AuthClient _authClient;

  @override
  String? get currentUserId => _databaseClient.currentUserId;

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  Stream<User> get user => _authClient.user
      .map((user) => User.fromAuthUser(authUser: user))
      .asBroadcastStream();

  /// Logs the current user out
  Future<void> logout() async {
    try {
      await _authClient.logout();
    } on LogoutFailure {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LogoutFailure(error), stackTrace);
    }
  }
}
