import 'package:get_it/get_it.dart';
import 'package:my_pharmacy/features/auth/data/repo/auth_repo_abstract.dart';
import 'package:my_pharmacy/features/auth/data/repo/auth_repo_implementation.dart';
import 'package:my_pharmacy/features/auth/presentation/cubit/auth_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // تسجيل الـ Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepoImplementation());

  // تسجيل الـ Cubits
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));
}
