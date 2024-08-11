import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/categories_row.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/nearest_pharmacy_list.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/search_row.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(right: 20.0.w, left: 20.0.w, top: 70.0.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 50.0.h),
            const SearchRow(),
            SizedBox(height: 21.0.h),
            const TitleText(title: AppStrings.kCategory),
            SizedBox(
                height:
                    10.0.h), // Add space between SearchRow and CategoriesRow
            // Add space between SearchRow and CategoriesRow
            const CategoryList(),
            SizedBox(height: 25.0.h),
            TitleText(
              title: AppStrings.kNearestString,
              onTap: () {
                GoRouter.of(context).push(RoutesNames.kNearestPharmacyView);
              },
            ),

            SizedBox(height: 15.0.h),
            const NearestPharmacyList(),
            SizedBox(height: 15.0.h),
            TitleText(
              title: AppStrings.kOffer50,
              onTap: () {
                GoRouter.of(context).push(RoutesNames.kOffer50View);
              },
            ),
            SizedBox(height: 15.0.h),
            const NearestPharmacyList(),
          ],
        ),
      ),
    ));
  }
}
