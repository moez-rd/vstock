part of 'login_cubit.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
    this.failed = false,
  });

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;
  final bool failed;

  @override
  List<Object?> get props =>
      [email, password, status, isValid, errorMessage, failed];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
    bool? failed,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      failed: failed ?? this.failed,
    );
  }
}
