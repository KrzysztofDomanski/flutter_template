import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:form_fields/src/formz_validation_mixin.dart';
import 'package:formz/formz.dart';

/// Validation errors for [Password]. It can be empty or invalid.
enum PasswordInputError {
  /// Empty password.
  empty,

  /// Invalid password.
  invalid,
}

/// {@template password}
/// Password input field
/// {@endtemplate}
@immutable
class Password extends FormzInput<String, PasswordInputError>
    with EquatableMixin, FormzValidationMixin {
  /// {@macro password.pure}
  const Password.pure([super.value = '']) : super.pure();

  /// {@macro password.dirty}
  const Password.dirty([
    super.value = '',
  ]) : super.dirty();

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty) {
      return PasswordInputError.empty;
    } else if (value.length < 8 || value.length > 120) {
      return PasswordInputError.invalid;
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [value, isPure];

  @override
  Map<PasswordInputError?, String?> get validationErrorMessage => {
        PasswordInputError.empty: 'This field is required',
        PasswordInputError.invalid:
            'Password should contain at least 6 characters',
        null: null,
      };
}
