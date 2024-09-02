import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pharmacy/features/pharmacises/data/model/pharmacy_model.dart';
import 'package:my_pharmacy/features/pharmacises/data/repo/pharmacy_repo.dart';

class PharmacyRepoImpl extends PharmacyRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<PharmacyModel>> fetchPharmacy() async {
    final snapshot = await _firestore.collection('pharmacies').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return PharmacyModel.fromMap(data);
    }).toList();
  }

 
}
