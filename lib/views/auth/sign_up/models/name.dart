import 'package:formz/formz.dart';

enum NameValidationError { empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure("");
  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    // Empty
    if (value.isEmpty) return NameValidationError.empty;
    return null;
  }

  String? getErrorMessage() {
    switch (error) {
      case NameValidationError.empty:
        return "Nama tidak boleh kosong";
      default:
        return null;
    }
  }
}
