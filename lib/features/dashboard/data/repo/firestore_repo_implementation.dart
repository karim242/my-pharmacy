import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pharmacy/features/dashboard/data/repo/firestore_repo.dart';
import 'package:my_pharmacy/features/home/data/models/category_model.dart';
import 'package:my_pharmacy/features/home/data/models/pharmacy_model.dart';
import 'package:my_pharmacy/features/home/data/models/product_model.dart';

class FirestoreRepositoryImpl implements FirestoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addCategory(CategoryModel category) async {
    await _firestore
        .collection('categories')
        .doc(category.id)
        .set(category.toJson());
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    await _firestore
        .collection('categories')
        .doc(category.id)
        .update(category.toJson());
  }

  @override
  Future<void> addProduct(String categoryId, ProductModel product) async {
    await _firestore
        .collection('categories')
        .doc(categoryId)
        .collection('products')
        .doc(product.id)
        .set(product.toJson());
  }

  @override
  Future<void> updateProduct(String categoryId, ProductModel product) async {
    await _firestore
        .collection('categories')
        .doc(categoryId)
        .collection('products')
        .doc(product.id)
        .update(product.toJson());
  }

  @override
  Future<void> addPharmacy(PharmacyModel pharmacy) async {
    await _firestore
        .collection('pharmacies')
        .doc(pharmacy.id)
        .set(pharmacy.toJson());
  }

  @override
  Future<void> updatePharmacy(PharmacyModel pharmacy) async {
    await _firestore
        .collection('pharmacies')
        .doc(pharmacy.id)
        .update(pharmacy.toJson());
  }
}
