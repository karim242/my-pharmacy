class Product {
  final String address;
  final String categoryName; 
  final String description;
  final String imageUrl;
  final String name;
  final String phone;
  final bool offer;
  final String pharmacyId;
  final String pharmacyName;
  final String pharmacyImage;
  final String price;

  Product({
    required this.address,
    required this.categoryName, 
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.offer,
    required this.pharmacyId,
    required this.pharmacyName,
    required this.pharmacyImage,
    required this.price,
  });

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      address: data['address'] as String,
      categoryName: data['categoryName'] as String, // إضافة الحقل الجديد
      description: data['description'] as String,
      imageUrl: data['imageUrl'] as String,
      name: data['name'] as String,
      phone: data['phone'] as String,

      offer: data['offer'] as bool,
      pharmacyId: data['pharmacyId'] as String,
      pharmacyName: data['pharmacyName'] as String,
      pharmacyImage: data['pharmacyimage'] as String,
      price: data['price'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'categoryName': categoryName, // إضافة الحقل الجديد
      'description': description,
      'imageUrl': imageUrl,
      'name': name,
      'phone': phone,
      'offer': offer,
      'pharmacyId': pharmacyId,
      'pharmacyName': pharmacyName,
      'pharmacyimage': pharmacyImage,
      'price': price,
    };
  }
}
