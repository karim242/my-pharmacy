part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeCategoriesLoadedState extends HomeState {
  final List<CategoryModel> categories;

  HomeCategoriesLoadedState({required this.categories});
}

class HomeNearbyPharmaciesSuccessState extends HomeState {
  final List<PharmacyModel> pharmacies;

  HomeNearbyPharmaciesSuccessState({required this.pharmacies});
}

class HomeDiscountedProductsSuccessState extends HomeState {
  final List<ProductModel> products;

  HomeDiscountedProductsSuccessState({required this.products});
}

class HomeProductsByCategorySuccessState extends HomeState {
  final List<ProductModel> products;

  HomeProductsByCategorySuccessState({required this.products});
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}
