import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';


import '../../features/auth/data/repo/auth_repo_abstract.dart';
import '../../features/auth/data/repo/auth_repo_implementation.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/cart/data/repo/cart_repo.dart';
import '../../features/cart/data/repo/cart_repo_impl.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/category/data/repo/categories_repo.dart';
import '../../features/category/data/repo/categories_repo_impl.dart';
import '../../features/category/presentation/cubit/category_cubit.dart';
import '../../features/chat/data/repo/chat_repo_impl.dart';
import '../../features/chat/presentation/cubit/chat_cubit.dart';
import '../../features/home/data/repo/product_repo.dart';
import '../../features/home/data/repo/product_repo_impl.dart';
import '../../features/home/presentation/cubit/all_product_cubit.dart';
import '../../features/offer/data/repo/offer_repo.dart';
import '../../features/offer/data/repo/offer_repo_impl.dart';
import '../../features/offer/presentation/cubit/offer_cubit.dart';
import '../../features/pharmacises/data/repo/pharmacy_repo.dart';
import '../../features/pharmacises/data/repo/pharmacy_repo_impl.dart';
import '../../features/pharmacises/presentation/cubit/pharmacy_cubit.dart';

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
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt<ProductsRepository>(),getIt<CartCubit>()));


//CategoriesRepo
  getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepoImpl());
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt<CategoriesRepo>()));
 

 //PharmacyRepo
  getIt.registerLazySingleton<PharmacyRepo>(() => PharmacyRepoImpl());
  getIt.registerFactory<PharmacyCubit>(() => PharmacyCubit(getIt<PharmacyRepo>()));

   //OfferRepo
  getIt.registerLazySingleton<OfferRepo>(() => OfferRepoImpl());
  getIt.registerFactory<OfferCubit>(() => OfferCubit(getIt<OfferRepo>()));



  //cartRepo
   getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl());
getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepository>()));

}
