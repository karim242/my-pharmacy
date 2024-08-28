import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/offer_repo.dart';
import 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  final OfferRepo _repository;

 OfferCubit(this._repository) : super(OfferInitial());

  

   Future<void> loadOfferPharmacy() async {
   emit( OfferLoading());
    try {
      final pharmacy = await _repository.fetchOfferPharmacy();
      emit(OfferLoaded(pharmacy));
    } catch (e) {
      emit(OfferError('Failed to load products: ${e.toString()}'));
    }
  }
}