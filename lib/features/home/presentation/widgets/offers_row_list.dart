import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/home/data/models/product_model.dart';
import 'package:my_pharmacy/features/home/data/models/product_model.dart';
import 'package:my_pharmacy/features/home/data/models/product_model.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_state.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/widgets/nearest_pharmacy_item.dart';

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
              itemCount: state.discountedProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: OffersItem(
                    productModel: state.discountedProducts[index],
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

class OffersItem extends StatelessWidget {
  const OffersItem({super.key, required this.productModel});
  final ProductModel productModel;
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
                // child: Image.network(
                //   ""
                //   // nearestPharmacy.imageUrl, // with your SVG image path
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: FittedBox(
                  child: Text(
                    productModel.name,
                    style: TextStyles.textStyle14,
                  ),
                )),
            //  Text(
            //   nearestPharmacy.distance,
            //   style: TextStyles.textStyle9,
            // ),
          ],
        ),
      ),
    );
  }
}
