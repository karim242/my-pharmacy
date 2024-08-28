import '../../data/model/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;

  CartLoaded(this.items);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}