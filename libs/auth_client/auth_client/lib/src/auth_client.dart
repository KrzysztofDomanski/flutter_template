import 'package:auth_client/src/models/auth_user.dart';

/// {@template auth_client}
/// Authentication client interface
/// {@endtemplate}
abstract class AuthClient {
  /// Stream of [AuthUser] that will emit a current
  /// user when the authentication state changes
  Stream<AuthUser> get user;

  /// Signs the user up with the provided [email] and [password]
  Future<void> signUpWithEmail({
    required String email,
    required String password,
  });

  /// Logs the user out
  Future<void> logout();
}
