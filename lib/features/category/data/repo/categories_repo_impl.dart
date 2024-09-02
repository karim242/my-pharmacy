import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pharmacy/features/category/data/model/categories_model.dart';
import 'package:my_pharmacy/features/category/data/repo/categories_repo.dart';

class CategoriesRepoImpl extends CategoriesRepo{

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<CategoriesModel>> fetchCategories() async {
     final snapshot = await _firestore.collection('categories').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return CategoriesModel.fromMap(data);
    }).toList();
  }
  }
