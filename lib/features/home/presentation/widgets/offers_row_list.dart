import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/features/home/data/models/nearest_pharmacy_static_model.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/nearest_pharmacy_item.dart';

class OfferRowList extends StatelessWidget {
  const OfferRowList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.15,
      width: 63.w,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: nearestPharmacyList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: NearestPharmacyItem(
                  nearestPharmacy: nearestPharmacyList[index],
                ));
          }),
    );
  }
}
