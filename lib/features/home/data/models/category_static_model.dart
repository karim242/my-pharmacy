import 'package:my_pharmacy/core/utils/app_images.dart';

class Category {
  final String image;
  final String title;
  final double price;
  final String pharmacyName;

  const Category(
      {required this.price,
      required this.image,
      required this.title,
      required this.pharmacyName});
}

const List<Category> categoryList = [
  Category(
      image: AppImages.elezabyImage,
      title: 'كريم أساس سافورا',
      pharmacyName: 'صيدلية الطرشوبي',
      price: 200),
  Category(
      image: AppImages.tarshobyImage,
      title: 'كريم أساس سافورا',
      pharmacyName: 'صيدلية الطرشوبي',
      price: 200),
  Category(
      image: AppImages.elezabyImage,
      title: 'كريم أساس سافورا',
      pharmacyName: 'صيدلية الطرشوبي',
      price: 200),
  Category(
      image: AppImages.tarshobyImage,
      title: 'كريم أساس سافورا',
      pharmacyName: 'صيدلية الطرشوبي',
      price: 200),
];
