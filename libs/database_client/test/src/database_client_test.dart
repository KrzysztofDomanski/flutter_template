// ignore_for_file: prefer_const_constructors

import 'package:database_client/database_client.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDatabaseClient extends Fake implements DatabaseClient {}

void main() {
  group('DatabaseClient', () {
    test('can be implemented', () {
      expect(MockDatabaseClient.new, returnsNormally);
    });
  });
}
