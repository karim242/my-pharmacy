import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/features/offer/presentation/widgets/offer_item.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_cubit.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_state.dart';

class OfferRowList extends StatelessWidget {
  const OfferRowList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PharmacyCubit, PharmacyState>(
      builder: (context, state) {
        if (state is PharmacyLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.pharmacy.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: state.pharmacy[index].offer == true
                      ? OffersItem(
                          pharmacy: state.pharmacy[index],
                        )
                      : const SizedBox(),
                );
              },
            ),
          );
        } else if (state is PharmacyLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PharmacyError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No Offer found'));
        }
      },
    );
  }
}
