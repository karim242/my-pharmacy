import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_state.dart';
import 'package:my_pharmacy/features/offer/widgets/offer_item.dart';

class OfferRowList extends StatelessWidget {
  const OfferRowList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().loadHomeData();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.nearbyPharmacies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: OffersItem(
                    pharmacyOffer: state.nearbyPharmacies[index],
                  ),
                );
              },
            ),
          );
        } else if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No data found'));
        }
      },
    );
  }
}
