/// {@template authentication_exception}
/// Base class for exceptions thrown from the authentication client.
/// {@endtemplate}
abstract class AuthenticationException implements Exception {
  /// {@macro authentication_exception}
  const AuthenticationException(this.error);

  /// The error which was caught.
  final Object error;

  @override
  String toString() => 'Authentication exception error: $error';
}

/// {@template sign_up_with_email_password_failure}
/// Exception thrown when sign up using an email and password fails
/// {@endtemplate}
class SignUpWithEmailAndPasswordFailure extends AuthenticationException {
  /// {@macro sign_up_with_email_password_failure}
  const SignUpWithEmailAndPasswordFailure(super.error);
}
