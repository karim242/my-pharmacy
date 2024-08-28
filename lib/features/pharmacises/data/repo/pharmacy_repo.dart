import 'package:my_pharmacy/features/pharmacises/data/model/pharmacy_model.dart';

abstract class PharmacyRepo{

  Future<List<PharmacyModel>> fetchPharmacy();
}