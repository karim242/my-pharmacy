class PharmacyModel {
  final String id;
  final String name;
  final bool offer;
  final String imageUrl;
  final String address;
  final String phone;
  

  PharmacyModel({
    required this.id, required this.name, required this.imageUrl,required this.address,required this.phone,required this.offer,
    });
  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      offer: json['offer'] ?? false,
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'offer': offer,
      'address': address,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
}
