class PharmacyModel {
  final String id;
  final String name;
  final String address;
  final String distance;
  final double rating;
  final String phoneNumber;
  final bool isNearby;

  PharmacyModel({
    required this.id,
    required this.name,
    required this.address,
    required this.distance,
    required this.rating,
    required this.phoneNumber,
    this.isNearby = false,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      distance: json['distance'],
      rating: json['rating'],
      phoneNumber: json['phone_number'],
      isNearby: json['is_nearby'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'distance': distance,
      'rating': rating,
      'phone_number': phoneNumber,
      'is_nearby': isNearby,
    };
  }
}
