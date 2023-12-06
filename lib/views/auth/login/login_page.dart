import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstock/config/dependencies.dart';
import 'package:vstock/viewmodels/log_in/login_cubit.dart';
import 'package:vstock/views/auth/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => getIt<LoginCubit>(),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
