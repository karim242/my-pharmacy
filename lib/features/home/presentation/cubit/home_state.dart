import 'package:my_pharmacy/features/home/data/models/category_model.dart';
import 'package:my_pharmacy/features/home/data/models/pharmacy_model.dart';
import 'package:my_pharmacy/features/home/data/models/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<CategoryModel> categories;
  final List<ProductModel> discountedProducts;
  final List<PharmacyModel> nearbyPharmacies;

  HomeSuccess({
    required this.categories,
    required this.discountedProducts,
    required this.nearbyPharmacies,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
