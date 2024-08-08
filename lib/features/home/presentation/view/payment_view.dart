import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/payment_textfield.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 38.0, left: 38.0, top: 70.0.h),
        child: SingleChildScrollView(
          child: Column(children: [
          const  TitleText(title: AppStrings.kBuyCart),
            SizedBox(height: 14.h),
          const  PaymentTextField(hintText:AppStrings.kName),
              SizedBox(height: 14.h),
           const PaymentTextField(hintText:AppStrings.kPhone),
              SizedBox(height: 14.h),
          const  PaymentTextField(hintText:AppStrings.kAddress),
              SizedBox(height: 14.h),
             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            PaymentSmallTextField(hintText:AppStrings.kAddress),

              ]
              ),
          ]),
        ),
      ),
    );
  }
}
