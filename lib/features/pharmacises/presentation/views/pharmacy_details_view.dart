import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/core/widget/add_to_cart_btn.dart';
import 'package:my_pharmacy/core/widget/call_us_btn.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/custom_grid_view.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/widgets/list_tile_in_view_details.dart';

class PharmacyDetailsView extends StatelessWidget {
  const PharmacyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 38.0, left: 38.0, top: 70.0.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  AppImages.elezabyImage, // Replace with your image path
                  fit: BoxFit.fill,
                  width: 138.r,
                  height: 116.r,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const TitleText(title: "صيدلية الطرشوبي"),
              SizedBox(
                height: 16.h,
              ),
              const ListTileInDetailView(
                title: 'شارع الترعة اعلي اهل الشام المنصورة الدقهلية',
                icon: AppImages.locationIcon,
              ),
              const ListTileInDetailView(
                title: 'دقيقة 25',
                icon: AppImages.deliveryIcon,
              ),
              const ListTileInDetailView(
                title: '01254665155',
                icon: AppImages.phoneIcon,
              ),
              SizedBox(
                height: 22.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddToCartBtn(
                    width: 136,
                    height: 34,
                  ),
                  CallUsBtn()
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              const CategoriesGridView()
            ],
          ),
        ),
      ),
    );
  }
}
