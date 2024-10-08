import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_background.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_button.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:my_pharmacy/core/widget/custom_toast.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              showToast("تم إنشاء الحساب بنجاح!");
              GoRouter.of(context).push(
                RoutesNames.kRootView,
              );
            } else if (state is SignUpFailureState) {
              showToast(state.errMessage);
            }
          },
          builder: (context, state) {
            return CustomBackGround(
              child: Column(children: [
                Image.asset(AppImages.logo),
                SizedBox(
                  height: 74.h,
                ),
                 Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppStrings.kCreateAccount(context),
                    style: TextStyles.textStyle20,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextField(
                  labelText: AppStrings.kName(context),
                  controller: _nameController,
                ),
                SizedBox(
                  height: 26.h,
                ),
                CustomTextField(
                  labelText: AppStrings.kEmail(context),
                  controller: _emailController,
                ),
                SizedBox(
                  height: 26.h,
                ),
                CustomTextField(
                  labelText: AppStrings.kPhone(context),
                  controller: _phoneController,
                ),
                SizedBox(
                  height: 26.h,
                ),
                CustomTextField(
                  labelText: AppStrings.kAddress(context),
                  controller: _addressController,
                ),
                SizedBox(
                  height: 26.h,
                ),
                CustomTextField(
                  labelText: AppStrings.kPassword(context),
                  controller: _passwordController,
                  obscureText: true,
                ),
                SizedBox(
                  height: 23.h,
                ),
                state is SignUpLoadingState
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        lebale: AppStrings.kCreateAccount(context),
                        onTap: () {
                          BlocProvider.of<AuthCubit>(context).signUp(
                            email: _emailController.text,
                            password: _passwordController.text,
                            name: _nameController.text,
                            phone: _phoneController.text,
                            address: _addressController.text,
                          );
                        },
                      )
              ]),
            );
          },
        ));
  }
}
