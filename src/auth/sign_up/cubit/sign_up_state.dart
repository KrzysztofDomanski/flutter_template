part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState._({
    required this.email,
    required this.password,
  });

  const SignUpState.initial()
      : this._(email: const Email.pure(), password: const Password.pure());

  final Email email;
  final Password password;

  @override
  List<Object?> get props => [email, password];

  /// Creates copy of current state with some fields updated.
  SignUpState copyWith({
    Email? email,
    Password? password,
  }) =>
      SignUpState._(
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
