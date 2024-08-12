import 'package:bloc/bloc.dart';
import 'package:my_pharmacy/features/home/data/models/category_model.dart';
import 'package:my_pharmacy/features/home/data/models/pharmacy_model.dart';
import 'package:my_pharmacy/features/home/data/models/product_model.dart';
import 'package:my_pharmacy/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepository;

  HomeCubit(this.homeRepository) : super(HomeInitial());

  Future<void> loadCategories() async {
    emit(HomeLoadingState());
    try {
      final categories = await homeRepository.getCategories();
      emit(HomeCategoriesLoadedState(categories: categories));
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> loadNearbyPharmacies() async {
    emit(HomeLoadingState());
    try {
      final pharmacies = await homeRepository.getNearbyPharmacies();
      emit(HomeNearbyPharmaciesLoadedState(pharmacies: pharmacies));
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> loadDiscountedProducts() async {
    emit(HomeLoadingState());
    try {
      final products = await homeRepository.getDiscountedProducts();
      emit(HomeDiscountedProductsLoadedState(products: products));
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> loadProductsByCategory(String categoryId) async {
    emit(HomeLoadingState());
    try {
      final products = await homeRepository.getProductsByCategory(categoryId);
      emit(HomeProductsByCategoryLoadedState(products: products));
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }
}
