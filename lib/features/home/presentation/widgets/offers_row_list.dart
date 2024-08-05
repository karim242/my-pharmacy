import 'package:flutter/material.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/nearest_pharmacy_item.dart';

class OfferRowList extends StatelessWidget {
  const OfferRowList({super.key});

  @override
  Widget build(BuildContext context) {
     return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Padding(
              padding:  EdgeInsets.only(left: 10.0),
              child: NearestPharmacyItem()
            );
          }),
    );
  }
}
