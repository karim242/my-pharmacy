
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/nearest_pharmacy_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 22,
      crossAxisSpacing: 12,
      axisDirection: AxisDirection.down,
      children: List.generate(
        30,
        (index) => const NearestPharmacyItem(),
      ),
    );
  }
}