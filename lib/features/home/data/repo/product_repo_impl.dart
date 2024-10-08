import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pharmacy/features/home/data/models/product.dart';
import 'package:my_pharmacy/features/home/data/repo/product_repo.dart';

class ProductRepositoryImpl implements ProductsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Product>> getProductsByCategory(String categoryName) async {
    final snapshot = await _firestore
        .collection('products')
        .where('categoryName', isEqualTo: categoryName)
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Product.fromMap(data);
    }).toList();
  }

  @override
  Future<List<Product>> getProductsByPharmacy(String pharmacyName) async {
    final snapshot = await _firestore
        .collection('products')
        .where('pharmacyName', isEqualTo: pharmacyName)
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Product.fromMap(data);
    }).toList();
  }

  @override
  Future<List<Product>> getProductsOnOffer(String pharmacyName) async {
    final snapshot = await _firestore
        .collection('products')
        .where('offer', isEqualTo: true) //+
        .where('pharmacyName', isEqualTo: pharmacyName) //+
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Product.fromMap(data);
    }).toList();
  }
  
  @override
  Future<List<Product>> getAllProducts() async {
    final snapshot = await _firestore
        .collection('products')
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Product.fromMap(data);
    }).toList();
}

 @override
  Future<void> updateAvailableQuantity(String productId, int newAvailableQuantity) async {
    try {
      await _firestore
          .collection('products')
          .doc(productId)
          .update({
        'availableQuantity': newAvailableQuantity,
      });
    } catch (e) {
      throw Exception('Failed to update available quantity: $e');
    }
  }
 
}