part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeCategoriesLoadedState extends HomeState {
  final List<CategoryModel> categories;

  HomeCategoriesLoadedState({required this.categories});
}

class HomeNearbyPharmaciesLoadedState extends HomeState {
  final List<PharmacyModel> pharmacies;

  HomeNearbyPharmaciesLoadedState({required this.pharmacies});
}

class HomeDiscountedProductsLoadedState extends HomeState {
  final List<ProductModel> products;

  HomeDiscountedProductsLoadedState({required this.products});
}

class HomeProductsByCategoryLoadedState extends HomeState {
  final List<ProductModel> products;

  HomeProductsByCategoryLoadedState({required this.products});
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}
