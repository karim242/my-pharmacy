import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_state.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/widgets/nearest_pharmacy_item.dart';

class NearestPharmacyList extends StatelessWidget {
  const NearestPharmacyList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.nearbyPharmacies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: NearestPharmacyItem(
                    nearestPharmacy: state.nearbyPharmacies[index],
                  ),
                );
              },
            ),
          );
        } else if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No data found'));
        }
      },
    );
  }
}
