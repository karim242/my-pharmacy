class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final bool isDiscounted;
  final double? discountPrice;
  final String categoryId;
  final String categoryName;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.isDiscounted = false,
    this.discountPrice,
    required this.categoryId,
    this.categoryName = '',
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      isDiscounted: json['isDiscounted'] ?? false,
      discountPrice: json['discountPrice']?.toDouble(),
      categoryId: json['categoryId'],
      categoryName: json['categoryName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'isDiscounted': isDiscounted,
      'discountPrice': discountPrice,
      'categoryId': categoryId,
      'categoryName': categoryName,
    };
  }
}
