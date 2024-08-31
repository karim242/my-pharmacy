class CartItem {
  final String productId;
  final String productName;
  final String productImage;
     int selectedQuantity;
  final String pharmacyName;
  final double price;

  CartItem({
    required this.productId,
    required this.pharmacyName,
    required this.productName,
    required this.productImage,
    required this.selectedQuantity,
    required this.price,
  });

  // تحويل بيانات من وإلى JSON
  factory CartItem.fromMap(Map<String, dynamic> data) {
    return CartItem(
      productId: data['productId'],
      productName: data['name'],
      pharmacyName: data['pharmacyName'],
      selectedQuantity: data['selectedQuantity']?? 0, 
      productImage: data['imageUrl'],
      price: data['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': productName,
      'pharmacyName': pharmacyName,
      'productImage': productImage,
      'selectedQuantity': selectedQuantity,
      'price': price,
    };
  }
}