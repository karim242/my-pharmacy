import '../../dependencies.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // تسجيل FirebaseFirestore
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  // تسجيل الـ Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepoImplementation());
  getIt.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImplementation());
  getIt
      .registerLazySingleton<ProductsRepository>(() => ProductRepositoryImpl());
  getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepoImpl());
  getIt.registerLazySingleton<PharmacyRepo>(() => PharmacyRepoImpl());
  getIt.registerLazySingleton<OfferRepo>(() => OfferRepoImpl());
  getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl());

  // تسجيل الـ Cubits
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));
  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt<ChatRepository>()));
  getIt.registerFactory<ProductCubit>(
      () => ProductCubit(getIt<ProductsRepository>(), getIt<CartCubit>()));
  getIt.registerFactory<CategoriesCubit>(
      () => CategoriesCubit(getIt<CategoriesRepo>()));
  getIt.registerFactory<PharmacyCubit>(
      () => PharmacyCubit(getIt<PharmacyRepo>()));
  getIt.registerFactory<OfferCubit>(() => OfferCubit(getIt<OfferRepo>()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepository>()));
}
