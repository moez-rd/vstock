import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstock/config/dependencies.dart';
import 'package:vstock/viewmodels/sign_up/sign_up_cubit.dart';
import 'package:vstock/views/auth/sign_up/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider<SignUpCubit>(
          create: (_) => getIt<SignUpCubit>(),
          child: const SignUpForm(),
        ),
      ),
    );
  }
}
