// ignore_for_file: prefer_const_constructors
import 'package:auth_client/auth_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockAuthClient extends Fake implements AuthClient {}

void main() {
  test('AuthClient can be implemented', () {
    expect(MockAuthClient.new, returnsNormally);
  });
}
