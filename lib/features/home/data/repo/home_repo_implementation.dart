import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pharmacy/features/home/data/models/category_model.dart';
import 'package:my_pharmacy/features/home/data/models/pharmacy_model.dart';
import 'package:my_pharmacy/features/home/data/models/product_model.dart';
import 'package:my_pharmacy/features/home/data/repo/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('categories').get();
    return snapshot.docs
        .map((doc) => CategoryModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String categoryId) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('products')
        .where('categoryId', isEqualTo: categoryId)
        .get();
    return snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<List<ProductModel>> getDiscountedProducts() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection("products")
        .where("isDiscounted", isEqualTo: true)
        .get();
    return snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<List<PharmacyModel>> getNearbyPharmacies() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("pharmacies").get();
    return snapshot.docs
        .map((doc) => PharmacyModel.fromJson(doc.data()))
        .toList();
  }
}
