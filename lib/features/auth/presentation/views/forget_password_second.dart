import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_background.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_button.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_forget_box.dart';

class ForgetPasswordSecond extends StatelessWidget {
  const ForgetPasswordSecond({super.key});

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
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppStrings.kForgetPassword(context),
                style: TextStyles.textStyle20,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                const CustomForgetBox(),
                SizedBox(
                  width: 10.w,
                ),
                const CustomForgetBox(),
                SizedBox(
                  width: 10.w,
                ),
                const CustomForgetBox(),
                SizedBox(
                  width: 10.w,
                ),
                const CustomForgetBox(),
                SizedBox(
                  width: 10.w,
                ),
                const CustomForgetBox(),
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    onTap: () {
                      //Todo: resend password
                    },
                    child: Text(
                    AppStrings.kResendCode(context) ,
                      style: TextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.whiteColor),
                    ))),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
              lebale:  AppStrings.kNextString(context),
              onTap: () {
                GoRouter.of(context).push(RoutesNames.kForgetPassThree);
              },
            )
          ]),
        ));
  }
}
