part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}


//Categories
class HomeCategoriesLoadingState extends HomeState {}

class HomeCategoriesSuccessState extends HomeState {
  final List<CategoryModel> categories;

  HomeCategoriesSuccessState({required this.categories});
}

class CategoriesErrorState extends HomeState {
  final String message;

  CategoriesErrorState({required this.message});
}

///NearbyPharmacies
class HomeNearbyPharmaciesLoadingState extends HomeState {}

class HomeNearbyPharmaciesSuccessState extends HomeState {
  final List<PharmacyModel> pharmacies;

  HomeNearbyPharmaciesSuccessState({required this.pharmacies});
}
class NearbyPharmaciesErrorState extends HomeState {
  final String message;

  NearbyPharmaciesErrorState({required this.message});
}
//HomeDiscountedProducts
class HomeDiscountedProductsLoadingState extends HomeState {}

class HomeDiscountedProductsSuccessState extends HomeState {
  final List<ProductModel> products;

  HomeDiscountedProductsSuccessState({required this.products});
}
class DiscountedProductsErrorState extends HomeState {
  final String message;

  DiscountedProductsErrorState({required this.message});
}


//ProductsByCategor

class HomeProductsByCategoryLoadingState extends HomeState {}

class HomeProductsByCategorySuccessState extends HomeState {
  final List<ProductModel> products;

  HomeProductsByCategorySuccessState({required this.products});
}

class ProductsByCategoryErrorState extends HomeState {
  final String message;

  ProductsByCategoryErrorState({required this.message});
}


