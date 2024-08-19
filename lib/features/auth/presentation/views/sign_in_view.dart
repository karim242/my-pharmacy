import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/core/widget/custom_toast.dart';
import 'package:my_pharmacy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_background.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_button.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_row_login.dart';
import 'package:my_pharmacy/features/auth/presentation/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class SignInView extends StatelessWidget {
  SignInView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            GoRouter.of(context).push(RoutesNames.kRootView);
          } else if (state is SignInFailureState) {
            showToast(state.errMessage);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: CustomBackGround(
              child: Column(
                children: [
                  Image.asset(AppImages.logo),
                  SizedBox(
                    height: 74.h,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.kSignIn,
                      style: TextStyles.textStyle20,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    labelText: AppStrings.kEmail,
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    labelText: AppStrings.kPassword,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(RoutesNames.kForgetPassOne);
                        },
                        child: Text(
                          AppStrings.kForgetPassword,
                          style: TextStyles.textStyle10.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.whiteColor),
                        ),
                      )),
                  SizedBox(
                    height: 26.h,
                  ),
                  state is SignInLoadingState
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          lebale: AppStrings.kSignIn,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              BlocProvider.of<AuthCubit>(context).signIn(
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                        ),
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
        },
      ),
    );
  }
}
