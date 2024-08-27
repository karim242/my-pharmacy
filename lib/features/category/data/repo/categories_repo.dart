import 'package:my_pharmacy/features/category/data/model/categories_model.dart';

abstract class CategoriesRepo{

  Future<List<CategoriesModel>> fetchCategories();
}