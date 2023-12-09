import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure("");
  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailInvalidRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }

    if (!_emailInvalidRegExp.hasMatch(value ?? "")) {
      return EmailValidationError.invalid;
    }

    return null;
  }

  String? getErrorMessage() {
    switch (error) {
      case EmailValidationError.empty:
        return "Email tidak boleh kosong";
      case EmailValidationError.invalid:
        return "Email tidak valid";
      default:
        return null;
    }
  }
}
