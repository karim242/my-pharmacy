

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/cart/presentation/widgets/payment_textfield.dart';

class ChangePasswordSheet extends StatelessWidget {
  const ChangePasswordSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleText(title: AppStrings.kChangePassword(context)),
          SizedBox(height: 30.h),
           PaymentTextField(hintText: AppStrings.kCurrentPassword(context)),
          SizedBox(height: 10.h),
           PaymentTextField(hintText: AppStrings.kNewPassword(context)),
          SizedBox(height: 10.h),
           PaymentTextField(hintText: AppStrings.kConfirmPassword(context)),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                ),
                child: const Text('إلغاء'),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                ),
                child: const Text('حفظ'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
