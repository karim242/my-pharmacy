import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/widgets/pharmacy_seemore.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/inner_search_row.dart';

class NearestPharmacyView extends StatelessWidget {
  const NearestPharmacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 38.0, left: 38.0, top: 50.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InnerSearchRow(),
              SizedBox(
                height: 15.h,
              ),
               TitleText(
                title: AppStrings.kNearestString(context),
              ),
              SizedBox(height: 15.0.h),
              const PharmacySeeMoreGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
