import 'package:database_client/database_client.dart';

/// {@template database_client}
/// Manages the application's database communication
/// {@endtemplate}
abstract class DatabaseClient implements UserBaseRepository {
  /// {@macro database_client}
  const DatabaseClient();
}
