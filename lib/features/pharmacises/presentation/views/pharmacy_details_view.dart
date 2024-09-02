import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/core/widget/add_to_cart_btn.dart';
import 'package:my_pharmacy/core/widget/call_us_btn.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/pharmacises/data/model/pharmacy_model.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/widgets/list_tile_in_view_details.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/widgets/pharmacy_grid_view.dart';

class PharmacyDetailsView extends StatelessWidget {
  const PharmacyDetailsView({
    super.key,
    required this.pharmacy,
  });
  // final PharmacyModel nearestPharmacy;
  final PharmacyModel pharmacy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 38.0, left: 38.0, top: 70.0.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  pharmacy.imageUrl, // Replace with your image path
                  fit: BoxFit.fill,
                  width: 138.r,
                  height: 116.r,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TitleText(title: pharmacy.name),
              SizedBox(
                height: 16.h,
              ),
              ListTileInDetailView(
                title: pharmacy.address,
                icon: AppImages.locationIcon,
              ),
              ListTileInDetailView(
                title: pharmacy.address,
                icon: AppImages.deliveryIcon,
              ),
              ListTileInDetailView(
                title: pharmacy.phone,
                icon: AppImages.phoneIcon,
              ),
              SizedBox(
                height: 22.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AddToCartBtn(
                    width: 136,
                    height: 34,
                  ),
                  CallUsBtn(
                    onTap: () {
                      GoRouter.of(context).push(
                        RoutesNames.kAllChatsView,
                      );
                    },
                  )
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              PharmacyGridView(
                pharmacyName: pharmacy.name,
              )
            ],
          ),
        ),
      ),
    );
  }
}
