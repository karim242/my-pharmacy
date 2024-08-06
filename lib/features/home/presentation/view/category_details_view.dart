import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/core/widget/price_box.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/list_tile_in_view_details.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 360.w,
            height: 250.h,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(230),
                //topRight: Radius.circular(30),
                bottomRight: Radius.circular(230),
              ),
              child: Image.asset(
                AppImages.elezabyImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'كريم أساس سافورا',
                            style: TextStyles.textStyle16
                                .copyWith(color: AppColors.blackColor),
                          ),
                          Text(
                            'صيدلية الطرشوبي',
                            style: TextStyles.textStyle12
                                .copyWith(color: const Color(0xff4A4A4A)),
                          ),
                        ],
                      ),
                      const PriceBox(),
                    ],
                  ),
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
                OtherCatedgoryItem()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OtherCatedgoryItem extends StatelessWidget {
  const OtherCatedgoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
                padding:  EdgeInsets.only(left: 10.0, top:18.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppImages.elezabyImage,
                    fit: BoxFit.cover,
                    width: 94.w,
                    height: 75.h,
                  ),
                ));
          }),
    );
  }
}
