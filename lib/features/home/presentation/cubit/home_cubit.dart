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
    emit(HomeCategoriesLoadingState());
    try {
      final categories = await homeRepository.getCategories();
      emit(HomeCategoriesSuccessState(categories: categories));
    } catch (e) {
      emit(CategoriesErrorState(message: e.toString()));
    }
  }

  Future<void> loadNearbyPharmacies() async {
    emit(HomeNearbyPharmaciesLoadingState());
    try {
      final pharmacies = await homeRepository.getNearbyPharmacies();
      emit(HomeNearbyPharmaciesSuccessState(pharmacies: pharmacies));
    } catch (e) {
      emit(NearbyPharmaciesErrorState(message: e.toString()));
    }
  }

  Future<void> loadDiscountedProducts() async {
    emit(HomeDiscountedProductsLoadingState());
    try {
      final products = await homeRepository.getDiscountedProducts();
      emit(HomeDiscountedProductsSuccessState(products: products));
    } catch (e) {
      emit(DiscountedProductsErrorState(message: e.toString()));
    }
  }

  Future<void> loadProductsByCategory(String categoryId) async {
    emit(HomeProductsByCategoryLoadingState());
    try {
      final products = await homeRepository.getProductsByCategory(categoryId);
      emit(HomeProductsByCategorySuccessState(products: products));
    } catch (e) {
      emit(ProductsByCategoryErrorState(message: e.toString()));
    }
  }

//   Future<void> callMethodsSequentially(HomeCubit cubit) async {
//     emit(HomeLoadingState());
//     await loadCategories();
//     await loadNearbyPharmacies();
//     await loadDiscountedProducts();
    
// }
}
