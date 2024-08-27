import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/features/category/data/repo/categories_repo.dart';
import 'package:my_pharmacy/features/category/presentation/cubit/category_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo _repository;

  CategoriesCubit(this._repository) : super(CategoriesInitial());

  Future<void> loadCategories() async {
   emit( CategoriesLoading());
    try {
      final categories = await _repository.fetchCategories();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError('Failed to load products: ${e.toString()}'));
    }
  }
}