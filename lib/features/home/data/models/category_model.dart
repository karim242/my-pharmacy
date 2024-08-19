class CategoryModel {
  final String id;
  final String name;
  final String address;
  final String pharmacyName;
  final String price;
  final String imageUrl;

  CategoryModel({
    required this.pharmacyName, // Added pharmacyName to the constructor parameters.
    required this.id,
    required this.price, // Added price to the constructor parameters.
    required this.name,
    required this.address, // Added address to the constructor parameters.
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '', // Added address to the json mapping.
      price: json['price'] ?? '', // Added price to the json mapping.
      imageUrl: json['imageUrl'] ?? '',
      pharmacyName: json['pharmacy name'] ??
          '', // Added pharmacyName to the json mapping.
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'address': address, // Added address to the json mapping.
      'price': price,
      'pharmacy name': pharmacyName, // Added pharmacyName to the json mapping.
    };
  }
}
