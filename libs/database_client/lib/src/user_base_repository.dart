/// {@template user_base_repo}
/// Base repository class
/// {@endtemplate}
abstract class UserBaseRepository {
  /// Returns the id of the currently logged in user
  String? get currentUserId;
}
