import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_cubit.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_state.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/widgets/nearest_pharmacy_item.dart';

class OfferSeeMoreGridView extends StatelessWidget {
  const OfferSeeMoreGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyCubit, PharmacyState>(
      builder: (context, state) {
        if (state is PharmacyLoaded) {
          return StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 22,
              crossAxisSpacing: 12,
              axisDirection: AxisDirection.down,
              children: List.generate(
                state.pharmacy.length,
                (index) =>state.pharmacy[index].offer==true? NearestPharmacyItem(
                  pharmacy: state.pharmacy[index],
                ):const SizedBox(width: 1,)
              ));
        } else if (state is PharmacyLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PharmacyError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No data found'));
        }
      },
    );
  }
}
