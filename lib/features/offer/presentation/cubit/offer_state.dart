
import '/features/pharmacises/data/model/pharmacy_model.dart';

abstract class OfferState {}

class OfferInitial extends OfferState {}
class OfferLoading extends OfferState {}

class OfferLoaded extends OfferState {
  final List<PharmacyModel> pharmacy;
  OfferLoaded(this.pharmacy);
}

class OfferError extends OfferState {
  final String message;
  OfferError(this.message);
}
