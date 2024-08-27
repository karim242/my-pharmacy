
import 'package:my_pharmacy/features/pharmacises/data/model/pharmacy_model.dart';

abstract class PharmacyState {}

class PharmacyInitial extends PharmacyState {}
class PharmacyLoading extends PharmacyState {}

class PharmacyLoaded extends PharmacyState {
  final List<PharmacyModel> pharmacy;
  PharmacyLoaded(this.pharmacy);
}

class PharmacyError extends PharmacyState {
  final String message;
  PharmacyError(this.message);
}
