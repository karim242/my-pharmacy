import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/core/widget/text_price_row.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/cart_item_list.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/next_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Removes the back button

        title: const TitleText(
          title: AppStrings.kBuyCart,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 38.0,
          left: 38.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 8),
              Text('الطرشوبي',
                  style: TextStyles.textStyle14.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                  )),

              SizedBox(height: 20.h),

              const CartItemList(),
              SizedBox(height: 20.h),
              TextField(
                decoration: InputDecoration(
                  hintText: ' اكتب رسالتك',
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 6),
                  fillColor: AppColors.lightGrayColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 20.h),
              const TitleText(title: 'اجمالي الحساب'),
              SizedBox(height: 20.h),
              const TextAndPriceRow(
                title: 'اجمالي المشتريات',
                price: 200,
              ),
              SizedBox(height: 20.h),
              const TextAndPriceRow(
                title: 'خدمة التوصيل',
                price: 20,
              ),
              SizedBox(height: 20.h),
              const TextAndPriceRow(
                title: 'المجموع',
                price: 220,
              ),
              SizedBox(height: 20.h),

              NextButton(
                lebale: AppStrings.kNextString,
                onTap: () {
                  GoRouter.of(context).push(RoutesNames.kPaymentView);
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
