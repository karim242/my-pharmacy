import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/inner_search_row.dart';
import 'package:my_pharmacy/features/offer/presentation/widgets/offer_seemore.dart';

class Offer50View extends StatelessWidget {
  const Offer50View({super.key});

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
                title: AppStrings.kOffer50(context),
              ),
              SizedBox(height: 15.0.h),
              const OfferSeeMoreGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
