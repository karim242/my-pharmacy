import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/core/widget/add_to_cart_btn.dart';
import 'package:my_pharmacy/core/widget/call_us_btn.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/core/widget/price_box.dart';
import 'package:my_pharmacy/features/home/data/models/category_model.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/choice_item_row.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/widgets/list_tile_in_view_details.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key, required this.category});
  final CategoryModel category;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                child: Image.network(
                  category.imageUrl,
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
                              category.name,
                              style: TextStyles.textStyle16
                                  .copyWith(color: AppColors.blackColor),
                            ),
                            Text(
                              category.pharmacyName,
                              style: TextStyles.textStyle12
                                  .copyWith(color: const Color(0xff4A4A4A)),
                            ),
                          ],
                        ),
                         PriceBox(price: category.price,),
                      ],
                    ),
                  ),
                   ListTileInDetailView(
                    title: category.address,
                    icon: AppImages.locationIcon,
                  ),
                   ListTileInDetailView(
                    title: category.name,
                    icon: AppImages.deliveryIcon,
                  ),
                  const ListTileInDetailView(
                    title: '01254665155',
                    icon: AppImages.phoneIcon,
                  ),
                  const OthersCatedgoryItem(),
                  SizedBox(height: 15.h),
                  const TitleText(title: 'الاختيارات'),
                  SizedBox(height: 10.h),
                  const ChoiceItemListRow(),
                  SizedBox(height: 15.h),
                  const TitleText(title: 'الوصف'),
                  SizedBox(height: 7.h),
                  const Text(
                    ' خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق "ليتراسيت" ',
                  ),
                  SizedBox(height: 20.h),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OthersCatedgoryItem extends StatelessWidget {
  const OthersCatedgoryItem({
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
                padding: EdgeInsets.only(left: 10.0, top: 18.h),
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
