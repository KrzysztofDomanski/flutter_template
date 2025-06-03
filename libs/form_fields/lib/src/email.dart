import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:form_fields/src/formz_validation_mixin.dart';
import 'package:formz/formz.dart';

/// Input validation errors
enum EmailInputError {
  /// No email
  empty,

  /// Invalid value
  invalid,
}

/// {@template email}
/// Email form input
/// {@endtemplate}
@immutable
class Email extends FormzInput<String, EmailInputError>
    with FormzValidationMixin, EquatableMixin {
  /// {@macro email.pure}
  const Email.pure([super.value = '']) : super.pure();

  /// {@macro email.dirty}
  const Email.dirty(super.value) : super.dirty();

  static final _emailRegex = RegExp(
    r'^(([\w-]+\.)+[\w-]+|([a-zA-Z]|[\w-]{2,}))@((([0-1]?'
    r'[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.'
    r'([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])'
    r')|([a-zA-Z]+[\w-]+\.)+[a-zA-Z]{2,4})$',
  );

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) return EmailInputError.empty;
    if (!_emailRegex.hasMatch(value)) return EmailInputError.invalid;
    return null;
  }

  /// Email validation errors message
  @override
  Map<EmailInputError?, String?> get validationErrorMessage => {
        EmailInputError.empty: 'This field is required',
        EmailInputError.invalid: 'Email is not correct',
        null: null,
      };

  @override
  List<Object> get props => [isPure, value];
}
