import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/core/widget/add_to_cart_btn.dart';
import 'package:my_pharmacy/core/widget/call_us_btn.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/core/widget/price_box.dart';
import 'package:my_pharmacy/features/home/data/models/product.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/choice_item_row.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/widgets/list_tile_in_view_details.dart';

import '../../../../core/widget/custom_toast.dart';
import '../../../home/presentation/cubit/all_product_cubit.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key, required this.product});
  // final CategoryModel category;
  //final ProductCategory category;
  final Product product;

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
                  product.imageUrl,
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
                              product.name,
                              style: TextStyles.textStyle16
                                  .copyWith(color: AppColors.blackColor),
                            ),
                            Text(
                              product.pharmacyName,

                              //   category.pharmacyName,
                              style: TextStyles.textStyle12
                                  .copyWith(color: const Color(0xff4A4A4A)),
                            ),
                          ],
                        ),
                        PriceBox(
                          price: product.price
                              .toString(), //category.price.toString(),
                        ),
                      ],
                    ),
                  ),
                  ListTileInDetailView(
                    title: product.address,
                    icon: AppImages.locationIcon,
                  ),
                  ListTileInDetailView(
                    title: product.address,
                    icon: AppImages.deliveryIcon,
                  ),
                  ListTileInDetailView(
                    title: product.phone,
                    icon: AppImages.phoneIcon,
                  ),
                  //  const OthersCatedgoryItem(),
                  SizedBox(height: 15.h),
                  TitleText(title: AppStrings.kChoices(context)),
                  SizedBox(height: 10.h),
                  const ChoiceItemListRow(),
                  SizedBox(height: 15.h),
                  TitleText(title: AppStrings.kDescription(context)),
                  SizedBox(height: 7.h),
                  Text(product.description),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddToCartBtn(
                        width: 136,
                        height: 34,
                        onTap: () {
                          context.read<ProductCubit>().addToCart(product);
                          showToast("Add to cart",);
                        },
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
