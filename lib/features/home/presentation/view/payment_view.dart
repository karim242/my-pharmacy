import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/next_button.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/payment_textfield.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 38.0, left: 38.0, top: 70.0.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios)),
                title: const TitleText(title: AppStrings.kPaymentString),
              ),
              SizedBox(height: 30.h),
              const PaymentTextField(hintText: AppStrings.kName),
              SizedBox(height: 16.h),
              const PaymentTextField(hintText: AppStrings.kPhone),
              SizedBox(height: 16.h),
              const PaymentTextField(hintText: AppStrings.kAddress),
              SizedBox(height: 16.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PaymentSmallTextField(hintText: AppStrings.kGovernorate),
                  PaymentSmallTextField(hintText: AppStrings.kCity),
                ],
              ),
              SizedBox(height: 16.h),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: CircleBtn(
                      isSelected: selectedIndex == 0,
                    )),
                title: const Text(
                  AppStrings.kPaymentInRecive,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: CircleBtn(
                      isSelected: selectedIndex == 1,
                    )),
                title: const Text(
                  AppStrings.kPaymentByVisa,
                ),
              ),
              SizedBox(height: 20.h),
              NextButton(
                lebale: AppStrings.kNextString,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleBtn extends StatelessWidget {
  const CircleBtn({
    super.key,
    this.isSelected = false,
  });
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: AppColors.lightGrayColor,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: CircleAvatar(
          radius: 8.h,
          backgroundColor:
              isSelected! ? AppColors.primaryColor : AppColors.lightGrayColor,
        ),
      ),
    );
  }
}
