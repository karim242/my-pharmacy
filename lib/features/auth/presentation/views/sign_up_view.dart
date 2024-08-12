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

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
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
                  AppStrings.kCreateAccount,
                  style: TextStyles.textStyle20,
                ),
              ),
              SizedBox(
                height: 24.h,

              ),
              CustomTextField(
                labelText: AppStrings.kName,
                controller: _nameController,
              ),
              SizedBox(
                height: 26.h,
              ),
               CustomTextField(
                labelText: AppStrings.kEmail,
                controller: _emailController,
              ),
              SizedBox(
                height: 26.h,
              ),
              CustomTextField(
                labelText: AppStrings.kPhone,
                controller: _phoneController,
              ),
              SizedBox(
                height: 26.h,
              ),
              CustomTextField(
                labelText: AppStrings.kAddress,
                controller: _addressController,
              ),
              SizedBox(
                height: 26.h,
              ),
              CustomTextField(
                labelText: AppStrings.kPassword,
                controller: _passwordController,
                obscureText: true,
              ),
              SizedBox(
                height: 23.h,
              ),
              CustomButton(
                lebale: AppStrings.kCreateAccount,
                onTap: () {
                  BlocProvider.of<AuthCubit>(context).signUp(
                    email: _emailController.text,
                     password:  _passwordController.text, 
                     name: _nameController.text,
                      phone: _phoneController.text, 
                      address:   _addressController.text
,
                    
                  
                   
                     );
                },
              )


            ]),
          )),
    );
  }
}
