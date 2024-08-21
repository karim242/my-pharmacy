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
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_text_field.dart';

class ForgetPasswordFrist extends StatelessWidget {
  const ForgetPasswordFrist({super.key});

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
             CustomTextField(
              labelText:  AppStrings.kPhone(context),
            ),
            SizedBox(
              height: 48.h,
            ),
            CustomButton(
              lebale:  AppStrings.kNextString(context),
              onTap: () {
                GoRouter.of(context).push(RoutesNames.kForgetPassTwo);
              },
            )
          ]),
        ));
  }
}
