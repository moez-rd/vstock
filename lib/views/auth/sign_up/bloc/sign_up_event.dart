part of 'sign_up_cubit.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends SignUpEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class EmailChanged extends SignUpEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignUpEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class ConfirmedPasswordChanged extends SignUpEvent {
  final String confirmedPassword;

  const ConfirmedPasswordChanged(this.confirmedPassword);

  @override
  List<Object> get props => [confirmedPassword];
}

class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}
