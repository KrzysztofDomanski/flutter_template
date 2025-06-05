import 'package:auth_client/auth_client.dart';

class User extends AuthUser {
  const User({
    required super.id,
    super.email,
    super.isNewUser,
  });

  factory User.fromAuthUser({required AuthUser authUser}) => User(
        id: authUser.id,
        email: authUser.email,
      );

  bool get isAnonymous => this == anonymous;

  static const User anonymous = User(id: '');
}
