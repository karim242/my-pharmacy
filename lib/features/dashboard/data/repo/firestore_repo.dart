import 'package:my_pharmacy/features/home/data/models/category_model.dart';
import 'package:my_pharmacy/features/home/data/models/pharmacy_model.dart';
import 'package:my_pharmacy/features/home/data/models/product_model.dart';

abstract class FirestoreRepository {
  Future<void> addCategory(CategoryModel category);
  Future<void> updateCategory(CategoryModel category);
  Future<void> addProduct(String categoryId, ProductModel product);
  Future<void> updateProduct(String categoryId, ProductModel product);
  Future<void> addPharmacy(PharmacyModel pharmacy);
  Future<void> updatePharmacy(PharmacyModel pharmacy);
}
