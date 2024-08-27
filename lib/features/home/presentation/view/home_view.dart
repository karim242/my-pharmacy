import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/category/presentation/widgets/categories_row.dart';
import 'package:my_pharmacy/features/offer/presentation/widgets/offers_row_list.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/widgets/nearest_pharmacy_list.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/search_row.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          right: 20.0.w,
          left: 20.0.w,
          top: 70.0.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchRow(),
              SizedBox(height: 21.0.h),
              TitleText(title: AppStrings.kCategory(context),
              ),
              SizedBox(height: 10.0.h),

              //CategoryList(categoryId:categoryId),//-
              const CategoryList(), //+

              SizedBox(height: 25.0.h),
              TitleText(
                title: AppStrings.kNearestString(context),
                onTap: () {
                  GoRouter.of(context).push(RoutesNames.kNearestPharmacyView);
                },
              ),
              SizedBox(height: 15.0.h),
              const NearestPharmacyList(),
              SizedBox(height: 15.0.h),
              TitleText(
                title: AppStrings.kOffer50(context),
                onTap: () {
                  GoRouter.of(context).push(RoutesNames.kOffer50View);
                },
              ),
              SizedBox(height: 15.0.h),
              const OfferRowList(),
            ],
          ),
        ),
      ),
    );
  }
}
