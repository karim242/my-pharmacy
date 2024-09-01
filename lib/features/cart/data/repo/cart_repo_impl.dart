import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/cart_model.dart';
import '/features/home/data/models/product.dart';

import 'cart_repo.dart';

class CartRepositoryImpl implements CartRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

 

  @override
  Future<void> removeFromCart(String productId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference cartRef = _firestore
          .collection('cart')
          .doc(user.uid)
          .collection('products')
          .doc(productId);

      await cartRef.delete();
    }
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot cartSnapshot = await _firestore
          .collection('cart')
          .doc(user.uid)
          .collection('products')
          .get();

      return cartSnapshot.docs
          .map((doc) => CartItem.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

@override
   Future<bool> cartExists() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference cartRef = _firestore
          .collection('cart')
          .doc(user.uid)
              .collection('products')
          .doc();

      DocumentSnapshot cartDoc = await cartRef.get();
      return cartDoc.exists;
    }
    return false;
  }

@override
   Future<void> addToCart(Product item) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference cartRef = _firestore
          .collection('cart')
          .doc(user.uid)
          .collection('products')
          .doc(item.productId);

      await cartRef.set(item.toMap());
    }
  }
  @override
  Future<void> updateSelectedQuantityInCart( String productId, int newSelectedQuantity) async {
    try {
       User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('cart')
          .doc(user.uid)
          .collection('products')
          .doc(productId)
          .update({
        'selectedQuantity': newSelectedQuantity,
      });
    }
    } catch (e) {
      throw Exception('Failed to update selected quantity: $e');
    }
  }


}
