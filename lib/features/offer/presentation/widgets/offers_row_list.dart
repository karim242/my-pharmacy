import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/features/offer/presentation/widgets/offer_item.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_cubit.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_state.dart';

import '../cubit/offer_cubit.dart';
import '../cubit/offer_state.dart';

class OfferRowList extends StatelessWidget {
  const OfferRowList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferCubit, OfferState>(
      builder: (context, state) {
        if (state is OfferLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.pharmacy.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: OffersItem(
                    pharmacy: state.pharmacy[index],
                  ),
                );
              },
            ),
          );
        } else if (state is OfferLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OfferError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No Offer found'));
        }
      },
    );
  }
}
