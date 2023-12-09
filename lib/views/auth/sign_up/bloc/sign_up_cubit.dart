import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:vstock/common/exceptions/firebase_exception.dart';
import 'package:vstock/repositories/authentication_repository.dart';
import 'package:vstock/views/auth/sign_up/models/confirmed_password.dart';
import 'package:vstock/views/auth/sign_up/models/email.dart';
import 'package:vstock/views/auth/sign_up/models/name.dart';
import 'package:vstock/views/auth/sign_up/models/password.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthenticationRepository _authenticationRepository;

  SignUpBloc(this._authenticationRepository) : super(const SignUpState()) {
    on<NameChanged>(_onNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmedPasswordChanged>(_onConfirmedPasswordChanged);
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  void _onNameChanged(NameChanged event, Emitter<SignUpState> emit) {
    final name = Name.dirty(event.name);

    emit(state.copyWith(
        name: name,
        isValid: Formz.validate(
            [name, state.email, state.password, state.confirmedPassword])));
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignUpState> emit) {
    final email = Email.dirty(event.email);

    emit(state.copyWith(
        email: email,
        isValid: Formz.validate(
            [email, state.name, state.password, state.confirmedPassword])));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignUpState> emit) {
    final password = Password.dirty(event.password);

    emit(state.copyWith(
        password: password,
        isValid: Formz.validate(
            [password, state.name, state.email, state.confirmedPassword])));
  }

  void _onConfirmedPasswordChanged(
      ConfirmedPasswordChanged event, Emitter<SignUpState> emit) {
    final confirmedPassword = ConfirmedPassword.dirty(event.confirmedPassword);

    emit(state.copyWith(
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate(
            [confirmedPassword, state.name, state.email, state.password])));
  }

  Future<void> _onSignUpSubmitted(
      SignUpSubmitted event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(errorMessage: ""));

    if (!state.isValid) return;

    if (state.password.value != state.confirmedPassword.value) {
      emit(state.copyWith(
        errorMessage: "Konfirmasi pasword tidak sesuai",
        status: FormzSubmissionStatus.failure,
      ));
      return;
    }

    try {
      await _authenticationRepository.signUp(
        name: state.name.value,
        email: state.email.value,
        password: state.password.value,
      );

      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  // void nameChanged(String value) {
  //   emit(
  //     state.copyWith(
  //       name: value,
  //     ),
  //   );
  // }
  //
  // void emailChanged(String value) {
  //   emit(
  //     state.copyWith(
  //       email: value,
  //     ),
  //   );
  // }
  //
  // void passwordChanged(String value) {
  //   emit(
  //     state.copyWith(
  //       password: value,
  //     ),
  //   );
  // }
  //
  // void confirmedPasswordChanged(String value) {
  //   emit(
  //     state.copyWith(
  //       confirmedPassword: value,
  //     ),
  //   );
  // }
  //
  // Future<void> signUpFormSubmitted() async {
  //   emit(state.copyWith(status: FormStatus.inProgress));
  //
  //   print(state);
  //
  //   try {
  //     await _authenticationRepository.signUp(
  //       name: state.name,
  //       email: state.email,
  //       password: state.password,
  //     );
  //
  //     emit(state.copyWith(status: FormStatus.success));
  //   } on SignUpWithEmailAndPasswordFailure catch (e) {
  //     emit(
  //       state.copyWith(
  //         errorMessage: e.message,
  //         status: FormStatus.failure,
  //       ),
  //     );
  //   } catch (_) {
  //     emit(state.copyWith(status: FormStatus.failure));
  //   }
  // }
}
