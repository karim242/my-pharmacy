import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/core/utils/app_router.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/auth/data/presentation/widgets/custom_background.dart';
import 'package:my_pharmacy/features/auth/data/presentation/widgets/custom_button.dart';
import 'package:my_pharmacy/features/auth/data/presentation/widgets/custom_row_login.dart';
import 'package:my_pharmacy/features/auth/data/presentation/widgets/custom_text_field.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: CustomBackGround(
        child:  Column(
            children: [
              Image.asset(AppImages.logo),
              SizedBox(
                height: 74.h,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "تسجيل الدخول",
                  style: TextStyles.textStyle20,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              const CustomTextField(
                labelText: 'رقم الهاتف',
              ),
              SizedBox(
                height: 26.h,
              ),
              const CustomTextField(
                labelText: 'كلمة المرور ',
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                            GoRouter.of(context).push(AppRouter.kForgetPassOne);

                    },
                    child:  Text(
                      ' هل نسيت كلمة المرور؟',
                      style: TextStyles.textStyle10.copyWith(
                        decoration: TextDecoration.underline,decorationColor:AppColors.whiteColor
                      ),
                    ),
                  )),
              SizedBox(
                height: 26.h,
              ),
               CustomButton(lebale: 'تسجيل الدخول',
              onTap: (){
                    GoRouter.of(context).push(AppRouter.kRootView);

              },),
              SizedBox(
                height: 26.h,
              ),
              const CustomLoginRow(),
               SizedBox(
                height: 36.h,
              ),
            ],
          ),
      ),
    );
  }
}

