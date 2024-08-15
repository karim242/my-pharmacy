class ProductModel {
  final String id;
  final String name;
  final double originalPrice;
  final double discountedPrice;
  final String imageUrl;
  final bool isDiscounted;

  ProductModel({
    required this.id,
    required this.name,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imageUrl,
    required this.isDiscounted,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      originalPrice:
          (json['originalPrice'] as num).toDouble(), // Convert safely
      discountedPrice:
          (json['discountedPrice'] as num).toDouble(), // Convert safely
      imageUrl: json['imageUrl'] ?? '',
      isDiscounted: json['isDiscounted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'originalPrice': originalPrice,
      'discountedPrice': discountedPrice,
      'imageUrl': imageUrl,
      'isDiscounted': isDiscounted,
    };
  }
}
