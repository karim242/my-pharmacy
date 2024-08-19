import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_pharmacy/features/auth/data/repo/auth_repo_abstract.dart';
import 'package:my_pharmacy/features/auth/data/repo/auth_repo_implementation.dart';
import 'package:my_pharmacy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_pharmacy/features/chat/data/repo/chat_repo_impl.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:my_pharmacy/features/dashboard/data/repo/firestore_repo.dart';
import 'package:my_pharmacy/features/dashboard/data/repo/firestore_repo_implementation.dart';
import 'package:my_pharmacy/features/dashboard/presentation/cubit/firestore_cubit.dart';
import 'package:my_pharmacy/features/home/data/repo/home_repo.dart';
import 'package:my_pharmacy/features/home/data/repo/home_repo_implementation.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // تسجيل الـ Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepoImplementation());

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImplementation());

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  getIt.registerLazySingleton<FirestoreRepository>(
      () => FirestoreRepositoryImpl());

  getIt.registerFactory<FirestoreCubit>(
      () => FirestoreCubit(getIt<FirestoreRepository>()));

  // تسجيل FirebaseFirestore
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  // تسجيل ChatRepositoryImpl
  getIt.registerLazySingleton<ChatRepositoryImpl>(
      () => ChatRepositoryImpl(getIt<FirebaseFirestore>()));

  // تسجيل ChatCubit
  getIt
      .registerFactory<ChatCubit>(() => ChatCubit(getIt<ChatRepositoryImpl>()));
}
