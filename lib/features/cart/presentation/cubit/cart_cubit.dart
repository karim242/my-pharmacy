import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/core/widget/custom_toast.dart';
import 'package:my_pharmacy/features/home/data/models/product.dart';

import '../../data/repo/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository _cartRepository;
//  final ProductCubit _productCubit;

  CartCubit(this._cartRepository, ) : super(CartInitial());
 int productNumber =0;


  Future<void> loadCartItems() async {
    try {
      emit(CartLoading());
      final items = await _cartRepository.getCartItems();
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartError("Failed to load cart items"));
    }
  }

  Future<void> addItemToCart(
    Product item,
  ) async {
    try {
      final cartExists = await _cartRepository.cartExists();
      if (cartExists) {
        // إذا لم يكن هناك مسار للعربة، أضف العنصر مباشرةً
        await _cartRepository.addToCart(item);
        await loadCartItems();
        return;
      }

      final items = await _cartRepository.getCartItems();

      if (items.isEmpty) {
        await _cartRepository.addToCart(item);
        await loadCartItems();
      } else {
        if (items.first.pharmacyName == item.pharmacyName) {
           if (items.first.productId == item.productId) {
              showToast("it's already in your cart");
           }else{
          await _cartRepository.addToCart(item);
           }
        } else {
          showToast(
              "You have a product from another pharmacy, pay so you can carry out the addition process from another pharmacy");
        }
      }

      // إعادة تحميل البيانات بعد الإضافة
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

Future<void> incrementQuantity( String productId, int currentSelectedQuantity) async {
    final newSelectedQuantity = currentSelectedQuantity + 1;
    await _cartRepository.updateSelectedQuantityInCart( productId, newSelectedQuantity);
    emit(CartUpdated());
  }

  Future<void> decrementQuantity( String productId, int currentSelectedQuantity) async {
    if (currentSelectedQuantity > 1) {
      final newSelectedQuantity = currentSelectedQuantity - 1;
      await _cartRepository.updateSelectedQuantityInCart( productId, newSelectedQuantity);
      emit(CartUpdated());
    } else {
      // Handle case where quantity is already 1 and can't be decreased
      print("Minimum quantity reached");
    }

}
 Future<void> updateCartAndProductQuantity(String userId, String productId, int currentSelectedQuantity, int currentAvailableQuantity) async {
    try {
      // Increment selected quantity in Cart
      await incrementQuantity( productId, currentSelectedQuantity);

      // Decrement available quantity in Product
      // await _productCubit.decrementAvailableQuantity(productId, currentAvailableQuantity);

      emit(CartUpdated());
    } catch (e) {
      emit(CartError("Failed to update quantities: $e"));
    }
  }
}
