import 'package:my_pharmacy/core/utils/app_images.dart';

class CategoryModel{
  final String image;
  final String title;
  final double price;
  final String pharmacyName;

 const CategoryModel({required this.price, required this.image, required this.title, required this.pharmacyName});

}
const List<CategoryModel> categoryList = [
CategoryModel(image: AppImages.elezabyImage, title:  'كريم أساس سافورا', pharmacyName: 'صيدلية الطرشوبي', price: 200),
CategoryModel(image: AppImages.tarshobyImage, title:  'كريم أساس سافورا', pharmacyName: 'صيدلية الطرشوبي', price: 200),
CategoryModel(image: AppImages.elezabyImage, title:  'كريم أساس سافورا', pharmacyName: 'صيدلية الطرشوبي', price: 200),
CategoryModel(image: AppImages.tarshobyImage, title:  'كريم أساس سافورا', pharmacyName: 'صيدلية الطرشوبي', price: 200),



];