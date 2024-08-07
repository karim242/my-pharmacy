import 'package:my_pharmacy/core/utils/app_images.dart';

class CartItemModel {
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  CartItemModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}
final List<CartItemModel> cartItems = [
    CartItemModel(
      name: 'كريم أساس سافورا',
      imageUrl: AppImages.elezabyImage,
      price: 19.99,
      quantity: 1,
    ),
    CartItemModel(
      name: 'كريم أساس سافورا',
      imageUrl: AppImages.tarshobyImage,
      price: 39.99,
      quantity: 2,
    ),
    // Add more CartItem objects
  ];