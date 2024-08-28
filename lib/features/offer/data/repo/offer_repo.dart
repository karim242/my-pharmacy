import '../../../pharmacises/data/model/pharmacy_model.dart';

abstract class OfferRepo{

  Future<List<PharmacyModel>> fetchOfferPharmacy();
}