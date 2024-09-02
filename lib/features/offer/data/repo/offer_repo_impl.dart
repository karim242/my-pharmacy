import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../pharmacises/data/model/pharmacy_model.dart';
import 'offer_repo.dart';

class  OfferRepoImpl extends OfferRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 
  @override
  Future<List<PharmacyModel>> fetchOfferPharmacy() async {
    final snapshot = await _firestore.collection('pharmacies').where('offer', isEqualTo: true).get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return PharmacyModel.fromMap(data);
    }).toList();
  }
}
