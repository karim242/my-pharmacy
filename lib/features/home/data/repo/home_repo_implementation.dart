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
        await _firestore.collection('categories').doc("categoryId").collection('products').get();
    return snapshot.docs
        .map((doc) =>
            CategoryModel.fromJson(doc.data()..putIfAbsent('id', () => doc.id)))
        .toList();
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String categoryId) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('categories')
        .doc(categoryId)
        .collection('products')
        .get();
    return snapshot.docs
        .map((doc) =>
            ProductModel.fromJson(doc.data()..putIfAbsent('id', () => doc.id)))
        .toList();
  }

  @override
  Future<List<ProductModel>> getDiscountedProducts() async {
    final categoriesSnapshot = await _firestore.collection('categories').get();
    List<ProductModel> discountedProducts = [];

    for (var categoryDoc in categoriesSnapshot.docs) {
      final productsSnapshot = await _firestore
          .collection('categories')
          .doc(categoryDoc.id)
          .collection('products')
          .where('isDiscounted', isEqualTo: true)
          .get();
      discountedProducts.addAll(
        productsSnapshot.docs
            .map((doc) => ProductModel.fromJson(
                doc.data()..putIfAbsent('id', () => doc.id)))
            .toList(),
      );
    }
    return discountedProducts;
  }

  @override
  Future<List<PharmacyModel>> getNearbyPharmacies() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('pharmacies').get();
    return snapshot.docs
        .map((doc) =>
            PharmacyModel.fromJson(doc.data()..putIfAbsent('id', () => doc.id)))
        .toList();
  }
}
