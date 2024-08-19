import 'package:my_pharmacy/core/utils/app_images.dart';

class NearestPharmacyModel {
  final String imageName;
  final String pharmacyName;

  const NearestPharmacyModel(
      {required this.imageName, required this.pharmacyName});
}

const List<NearestPharmacyModel> nearestPharmacyList = [
  NearestPharmacyModel(
      imageName: AppImages.elezabyImage, pharmacyName: 'صيدلية العزبي'),
  NearestPharmacyModel(
      imageName: AppImages.tarshobyImage, pharmacyName: 'صيدلية الطرشوبي'),
  NearestPharmacyModel(
      imageName: AppImages.elezabyImage, pharmacyName: 'صيدلية العزبي'),
  NearestPharmacyModel(
      imageName: AppImages.tarshobyImage, pharmacyName: 'صيدلية الطرشوبي'),
];
