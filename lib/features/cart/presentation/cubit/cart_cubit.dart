import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/features/home/data/models/product.dart';

import '../../data/repo/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository _cartRepository;

  CartCubit(this._cartRepository) : super(CartInitial());

  Future<void> loadCartItems() async {
    try {
      emit(CartLoading());
      final items = await _cartRepository.getCartItems();
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartError("Failed to load cart items"));
    }
  }

  Future<void> addItemToCart(Product item) async {
    try {
      await _cartRepository.addToCart(item);
      await loadCartItems(); // إعادة تحميل البيانات بعد الإضافة
    } catch (e) {
      emit(CartError("Failed to add item to cart"));
    }
  }

  Future<void> removeItemFromCart(String productId) async {
    try {
      await _cartRepository.removeFromCart(productId);
      await loadCartItems(); // إعادة تحميل البيانات بعد الحذف
    } catch (e) {
      emit(CartError("Failed to remove item from cart"));
    }
  }
}
