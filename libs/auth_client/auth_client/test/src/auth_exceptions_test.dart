import 'package:auth_client/src/auth_exceptions.dart';
import 'package:test/test.dart';

void main() {
  test('exports SignUpWithEmailAndPasswordFailure', () {
    expect(
      () => const SignUpWithEmailAndPasswordFailure('oops'),
      returnsNormally,
    );
  });
}
