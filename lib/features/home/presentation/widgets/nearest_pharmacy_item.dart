import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/home/data/models/nearest_pharmacy_model.dart';

class NearestPharmacyItem extends StatelessWidget {
  const NearestPharmacyItem({super.key, required this.nearestPharmacy});
  final NearestPharmacyModel nearestPharmacy;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(RoutesNames.kPharmacyDetailsView);
      },
      child: SizedBox(
        width: 80.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  nearestPharmacy.imageName, //Replace with your SVG image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: FittedBox(
                  child: Text(
                    nearestPharmacy.pharmacyName,
                    style: TextStyles.textStyle14,
                  ),
                )),
            const Text(
              ' 25 دقيقة',
              style: TextStyles.textStyle9,
            ),
          ],
        ),
      ),
    );
  }
}
