import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_background.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_button.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: CustomBackGround(
          child: Column(children: [
            Image.asset(AppImages.logo),
            SizedBox(
              height: 74.h,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "انشاء حساب",
                style: TextStyles.textStyle20,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            const CustomTextField(
              labelText: 'الاسم',
            ),
            SizedBox(
              height: 26.h,
            ),
            const CustomTextField(
              labelText: 'رقم الهاتف',
            ),
            SizedBox(
              height: 26.h,
            ),
            const CustomTextField(
              labelText: 'العنوان ',
            ),
            SizedBox(
              height: 26.h,
            ),
            const CustomTextField(
              labelText: 'كلمة المرور ',
            ),
            SizedBox(
              height: 23.h,
            ),
            const CustomButton(
              lebale: 'انشاء حساب ',
            )
          ]),
        ));
  }
}
