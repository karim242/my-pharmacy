import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/next_button.dart';
import 'package:my_pharmacy/features/cart/presentation/widgets/payment_textfield.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        title:  TitleText(title: AppStrings.kPaymentString(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 38.0,
          left: 38.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
               PaymentTextField(hintText: AppStrings.kName(context)),
              SizedBox(height: 16.h),
               PaymentTextField(hintText: AppStrings.kPhone(context)),
              SizedBox(height: 16.h),
               PaymentTextField(hintText: AppStrings.kAddress(context)),
              SizedBox(height: 16.h),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PaymentSmallTextField(hintText: AppStrings.kGovernorate(context)),
                  PaymentSmallTextField(hintText: AppStrings.kCity(context)),
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
                title:  Text(
                  AppStrings.kPaymentInRecive(context),
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
                title:  Text(
                  AppStrings.kPaymentByVisa(context),
                ),
              ),
              SizedBox(height: 20.h),
              NextButton(
                lebale: AppStrings.kNextString(context),
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
