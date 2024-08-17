import 'package:bloc/bloc.dart';
import 'package:my_pharmacy/features/home/data/repo/home_repo.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(HomeLoading());

    try {
      final categories = await _homeRepo.getCategories();
      final discountedProducts = await _homeRepo.getDiscountedProducts();
      final nearbyPharmacies = await _homeRepo.getNearbyPharmacies();

      emit(HomeSuccess(
        categories: categories,
        discountedProducts: discountedProducts,
        nearbyPharmacies: nearbyPharmacies,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
      print(e.toString());
    }
  }
}
