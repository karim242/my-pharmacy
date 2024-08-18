import 'package:my_pharmacy/features/home/data/models/category_model.dart';
import 'package:my_pharmacy/features/home/data/models/pharmacy_model.dart';
import 'package:my_pharmacy/features/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<List<CategoryModel>> getCategories( );
  Future<List<ProductModel>> getProductsByCategory(String categoryId);
  Future<List<ProductModel>> getDiscountedProducts();
  Future<List<PharmacyModel>> getNearbyPharmacies();
}
