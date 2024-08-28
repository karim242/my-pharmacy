import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/home/data/models/product.dart';

import '../../../../core/widget/add_to_cart_btn.dart';

class CategoryViewItem extends StatelessWidget {
  const CategoryViewItem({super.key, required this.product, });
  // final CategoryModel category;
final Product product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 180.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              
              GoRouter.of(context)
                  .push(RoutesNames.kCategoryDetailsView,
                      extra: product);
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                  child: Image.network(product.imageUrl,
                    //category.imageUrl,
                      fit: BoxFit.cover, width: 100.w, height: 90.h),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                      width: 44.w,
                      height: 20.h,
                      decoration: const BoxDecoration(
                        color: Color(0xffE1D8C3),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'EGP   ',
                            style: TextStyles.textStyle9.copyWith(
                                fontSize: 6, color: AppColors.secondColor),
                          ),
                          Text( product.price.toString(),
                            // category.price,
                            style: TextStyles.textStyle9
                                .copyWith(color: AppColors.secondColor),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Text(
           product.name,
            style: TextStyles.textStyle12.copyWith(
                color: AppColors.secondColor, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Text(
             product.pharmacyName,
            //  category.pharmacyName,
              style: TextStyles.textStyle9,
            ),
          ),
          const AddToCartBtn()
        ],
      ),
    );
  }
}
