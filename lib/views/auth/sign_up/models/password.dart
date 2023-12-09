import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure("");
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordInvalidRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }

    if (!_passwordInvalidRegExp.hasMatch(value ?? "")) {
      return PasswordValidationError.invalid;
    }

    return null;
  }

  String? getErrorMessage() {
    switch (error) {
      case PasswordValidationError.empty:
        return "Password tidak boleh kosong";
      case PasswordValidationError.invalid:
        return "Karakter password harus melebihi 8 karakter, memiliki huruf dan angka";
      default:
        return null;
    }
  }
}
