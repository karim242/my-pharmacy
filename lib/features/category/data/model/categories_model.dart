class CategoriesModel {
  final String id;
  final String name;
  final String imageUrl;
  CategoriesModel(
      {required this.id, required this.name, required this.imageUrl});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

   Map<String, dynamic> toJson() {
     return {
       'id': id,
       'name': name,
     'imageUrl': imageUrl,
     };
   }
}
