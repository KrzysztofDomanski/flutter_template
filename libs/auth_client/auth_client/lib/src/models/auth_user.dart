import 'package:equatable/equatable.dart';

/// {@template auth_user}
/// Authentication user model
/// {@endtemplate}
class AuthUser extends Equatable {
  /// {@macro auth_user}
  const AuthUser({required this.id, this.email, this.isNewUser = true});

  final String? email;
  final String id;
  final bool isNewUser;

  @override
  List<Object?> get props => [
        email,
        id,
        isNewUser,
      ];
}
