import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vstock/app.dart';
import 'package:vstock/config/dependencies.dart';
import 'package:vstock/config/firebase_options.dart';
import 'package:vstock/repositories/authentication_repository.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();

  getIt<AuthenticationRepository>().user.first;

  runApp(const App());
}
