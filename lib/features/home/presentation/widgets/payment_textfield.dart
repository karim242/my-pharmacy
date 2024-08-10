import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';

class PaymentTextField extends StatelessWidget {
  const PaymentTextField({super.key, required this.hintText, this.obscureText=false});
  final String hintText;
 final bool? obscureText ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      // width: 228.w,
      child: TextField(
        // onSubmitted: (data) {

        // },
             obscureText: obscureText!,

        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          
          //contentPadding:const EdgeInsets.all(16),
          fillColor: AppColors.lightGrayColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class PaymentSmallTextField extends StatelessWidget {
  const PaymentSmallTextField({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.h,
      width: 140.w,
      child: TextField(
        // onSubmitted: (data) {

        // },
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          contentPadding: const EdgeInsets.all(16),
          fillColor: AppColors.lightGrayColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
