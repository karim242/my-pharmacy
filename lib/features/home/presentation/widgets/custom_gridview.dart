import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_pharmacy/features/home/data/models/nearest_pharmacy_static_model.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/nearest_pharmacy_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //context.read<HomeCubit>()..loadNearbyPharmacies();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if(state is HomeNearbyPharmaciesSuccessState)
        {
        return StaggeredGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 22,
          crossAxisSpacing: 12,
          axisDirection: AxisDirection.down,
          children: List.generate(
            state.pharmacies.length,
            (index) => NearestPharmacyItem(
                nearestPharmacy: state.pharmacies[index]),
          ),
        );
      
         }else if(state is HomeNearbyPharmaciesLoadingState){

          return const Center(child: CircularProgressIndicator());
        }
        else{

          return SizedBox(
            child: Text('no Data found'),
          );
        }
      }
    );
  }
}
