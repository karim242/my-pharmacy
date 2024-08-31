import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/features/home/data/repo/product_repo.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/all_product_state.dart';

import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../data/models/product.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepository _repository;
 
  final CartCubit cartCubit;

  ProductCubit(this._repository, this.cartCubit) : super(ProductInitial());

  Future<void> loadProducts(String categoryName) async {
   emit( ProductLoading());
    try {
      final products = await _repository.getProductsByCategory(categoryName);
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Failed to load products: ${e.toString()}'));
    }
  }
  

  Future<void> loadProductsOnOffer(String pharmacyName) async {
   emit( ProductLoading());

    try {
      final products = await _repository.getProductsOnOffer( pharmacyName);
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Failed to load products on offer: ${e.toString()}'));
    }
  }

  Future<void> loadProductsByPharmacyName(String pharmacyName) async {
   emit( ProductLoading());

    try {
      final products = await _repository.getProductsByPharmacy(pharmacyName);
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Failed to load products by category: ${e.toString()}'));
    }
  }

  Future<void> loadAllProduct() async {
   emit( ProductLoading());

    try {
      final products = await _repository.getAllProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Failed to load pharmacies: ${e.toString()}'));
    }
  }

Future<void> decrementAvailableQuantity(String productId, int currentAvailableQuantity) async {
    if (currentAvailableQuantity > 0) {
      final newAvailableQuantity = currentAvailableQuantity - 1;
      await _repository.updateAvailableQuantity(productId, newAvailableQuantity);
      emit(ProductUpdated());
    } else {
      // Handle case where no stock is available
      print("No stock available");
    }
  }

  Future<void> incrementAvailableQuantity(String productId, int currentAvailableQuantity) async {
    final newAvailableQuantity = currentAvailableQuantity + 1;
    await _repository.updateAvailableQuantity(productId, newAvailableQuantity);
    emit(ProductUpdated());
  }

   

   Future<void> addToCart(Product item,) async {
    try {
     
      await cartCubit.addItemToCart(item,);
    } catch (e) {
      emit(ProductError("Failed to add product to cart"));
    }
  }
}