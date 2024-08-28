import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/features/pharmacises/data/repo/pharmacy_repo.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_state.dart';

class PharmacyCubit extends Cubit<PharmacyState> {
  final PharmacyRepo _repository;

 PharmacyCubit(this._repository) : super(PharmacyInitial());

  Future<void> loadPharmacy() async {
   emit( PharmacyLoading());
    try {
      final pharmacy = await _repository.fetchPharmacy();
      emit(PharmacyLoaded(pharmacy));
    } catch (e) {
      emit(PharmacyError('Failed to load products: ${e.toString()}'));
    }
  }


}