import 'package:equatable/equatable.dart';

/// {@template auth_user}
/// Authentication user model
/// {@endtemplate}
class AuthUser extends Equatable {
  /// {@macro auth_user}
  const AuthUser({required this.id, this.email});

  final String? email;
  final String id;

  @override
  List<Object?> get props => [
        email,
        id,
      ];
}
