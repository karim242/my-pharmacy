class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
