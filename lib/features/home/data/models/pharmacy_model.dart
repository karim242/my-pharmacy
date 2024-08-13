class PharmacyModel {
  final String id;
  final String name;
  final String address;
  final String imageUrl;
  final String distance;
  final String phoneNumber;
  final bool isNearby;

  PharmacyModel( {
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.distance,
    required this.phoneNumber,
    this.isNearby = false,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      imageUrl: json['image'],
      distance: json['distance'],
      phoneNumber: json['phone_number'],
      isNearby: json['is_nearby'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'image' : imageUrl,
      'distance': distance,
      'phone_number': phoneNumber,
      'is_nearby': isNearby,
    };
  }
}
