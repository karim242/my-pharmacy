// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_pharmacy/features/dashboard/data/repo/firestore_repo.dart';
// import 'package:my_pharmacy/features/dashboard/presentation/cubit/firestore_state.dart';
// import 'package:my_pharmacy/features/home/data/models/category_model.dart';

// // class FirestoreCubit extends Cubit<FirestoreState> {
//   final FirestoreRepository _repository;

//   FirestoreCubit(this._repository) : super(FirestoreInitial());

//   Future<void> addCategory(CategoryModel category) async {
//     emit(FirestoreLoading());
//     try {
//       await _repository.addCategory(category);
//       emit(FirestoreSuccess('Category added successfully'));
//     } catch (e) {
//       emit(FirestoreError('Failed to add category: ${e.toString()}'));
//     }
//   }

//   Future<void> updateCategory(CategoryModel category) async {
//     emit(FirestoreLoading());
//     try {
//       await _repository.updateCategory(category);
//       emit(FirestoreSuccess('Category updated successfully'));
//     } catch (e) {
//       emit(FirestoreError('Failed to update category: ${e.toString()}'));
//     }
//   }

//   Future<void> addProduct(String categoryId, ProductModel product) async {
//     emit(FirestoreLoading());
//     try {
//       await _repository.addProduct(categoryId, product);
//       emit(FirestoreSuccess('Product added successfully'));
//     } catch (e) {
//       emit(FirestoreError('Failed to add product: ${e.toString()}'));
//     }
//   }

//   Future<void> updateProduct(String categoryId, ProductModel product) async {
//     emit(FirestoreLoading());
//     try {
//       await _repository.updateProduct(categoryId, product);
//       emit(FirestoreSuccess('Product updated successfully'));
//     } catch (e) {
//       emit(FirestoreError('Failed to update product: ${e.toString()}'));
//     }
//   }

//   Future<void> addPharmacy(PharmacyModel pharmacy) async {
//     emit(FirestoreLoading());
//     try {
//       await _repository.addPharmacy(pharmacy);
//       emit(FirestoreSuccess('Pharmacy added successfully'));
//     } catch (e) {
//       emit(FirestoreError('Failed to add pharmacy: ${e.toString()}'));
//     }
//   }

//   Future<void> updatePharmacy(PharmacyModel pharmacy) async {
//     emit(FirestoreLoading());
//     try {
//       await _repository.updatePharmacy(pharmacy);
//       emit(FirestoreSuccess('Pharmacy updated successfully'));
//     } catch (e) {
//       emit(FirestoreError('Failed to update pharmacy: ${e.toString()}'));
//     }
//   }
// }
