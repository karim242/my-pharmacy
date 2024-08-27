import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_pharmacy/features/auth/data/repo/auth_repo_abstract.dart';
import 'package:my_pharmacy/features/auth/data/repo/auth_repo_implementation.dart';
import 'package:my_pharmacy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_pharmacy/features/category/data/repo/categories_repo.dart';
import 'package:my_pharmacy/features/category/data/repo/categories_repo_impl.dart';
import 'package:my_pharmacy/features/category/presentation/cubit/category_cubit.dart';
import 'package:my_pharmacy/features/chat/data/repo/chat_repo_impl.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:my_pharmacy/features/home/data/repo/product_repo.dart';
import 'package:my_pharmacy/features/home/data/repo/product_repo_impl.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/all_product_cubit.dart';
import 'package:my_pharmacy/features/pharmacises/data/repo/pharmacy_repo.dart';
import 'package:my_pharmacy/features/pharmacises/data/repo/pharmacy_repo_impl.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // تسجيل الـ Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepoImplementation());

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));


  // تسجيل FirebaseFirestore
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  // تسجيل ChatRepositoryImpl
  getIt.registerLazySingleton<ChatRepositoryImpl>(
      () => ChatRepositoryImpl(getIt<FirebaseFirestore>()));

  // تسجيل ChatCubit
  getIt
      .registerFactory<ChatCubit>(() => ChatCubit(getIt<ChatRepositoryImpl>()));

  // Register repositories

  //ProductsRepo
  getIt.registerLazySingleton<ProductsRepository>(() => ProductRepositoryImpl());
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt<ProductsRepository>()));


//CategoriesRepo
  getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepoImpl());
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt<CategoriesRepo>()));
 

 //PharmacyRepo
  getIt.registerLazySingleton<PharmacyRepo>(() => PharmacyRepoImpl());
  getIt.registerFactory<PharmacyCubit>(() => PharmacyCubit(getIt<PharmacyRepo>()));
}
