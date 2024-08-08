import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_router.dart';
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
      body: Padding(
        padding: EdgeInsets.only(right: 38.0, left: 38.0, top: 70.0.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleText(title: AppStrings.kBuyCart),
                  const SizedBox(height: 8),
                  Text('الطرشوبي',
                      style: TextStyles.textStyle10.copyWith(
                        color: AppColors.blackColor,
                      )),
                ],
              ),
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

              NextButton(lebale:AppStrings.kNextString,
              onTap: (){
                GoRouter.of(context).push(AppRouter.kPaymentView);
              },),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
