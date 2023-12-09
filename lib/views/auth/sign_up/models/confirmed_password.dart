import 'package:formz/formz.dart';

enum ConfirmedPasswordValidationError { empty }

class ConfirmedPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  const ConfirmedPassword.pure() : super.pure("");
  const ConfirmedPassword.dirty([super.value = '']) : super.dirty();

  @override
  ConfirmedPasswordValidationError? validator(String value) {
    // Empty
    if (value.isEmpty) return ConfirmedPasswordValidationError.empty;
    return null;
  }

  String? getErrorMessage() {
    switch (error) {
      case ConfirmedPasswordValidationError.empty:
        return "Password tidak boleh kosong";
      default:
        return null;
    }
  }
}
