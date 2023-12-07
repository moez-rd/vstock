import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:vstock/repositories/authentication_repository.dart';
import 'package:vstock/repositories/enterprise_repository.dart';
import 'package:vstock/repositories/product_repository.dart';
import 'package:vstock/viewmodels/app/app_bloc.dart';
import 'package:vstock/viewmodels/log_in/login_cubit.dart';
import 'package:vstock/viewmodels/sign_up/sign_up_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // ===== Firestore =====
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  // ===== Repositories =====
  getIt.registerSingleton<AuthenticationRepository>(AuthenticationRepository());
  getIt.registerSingleton<ProductRepository>(
      ProductRepository(firebaseFirestore: getIt<FirebaseFirestore>()));
  getIt.registerSingleton<EnterpriseRepository>(
      EnterpriseRepository(firebaseFirestore: getIt<FirebaseFirestore>()));

  // ===== Cubit =====
  getIt.registerSingleton<SignUpCubit>(
      SignUpCubit(getIt<AuthenticationRepository>()));
  getIt.registerSingleton<LoginCubit>(
      LoginCubit(getIt<AuthenticationRepository>()));

  // ====== Bloc =====
  getIt.registerSingleton<AppBloc>(
      AppBloc(authenticationRepository: getIt<AuthenticationRepository>()));
}
