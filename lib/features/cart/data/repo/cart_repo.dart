
import '../../../home/data/models/product.dart';
import '../model/cart_model.dart';

abstract class CartRepository {
 ///addToCart
   Future<void> addToCart(Product item);
  Future<void> removeFromCart(String productId);
  Future<List<CartItem>> getCartItems();
   Future<bool> cartExists();
 // Future<void> checkCart(Product item);
}