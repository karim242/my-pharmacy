import 'package:flutter/material.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';

abstract class TextStyles {
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.secondColor,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.secondColor,
  );
  static const textStyle20 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static const textStyle7 = TextStyle(
      fontSize: 7, fontWeight: FontWeight.w400, color: AppColors.grayColor);
  static const textStyle9 = TextStyle(
      fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static const textStyle10 = TextStyle(
      fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.whiteColor);
  static const textStyle12 = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.whiteColor);
  static const textStyle11 = TextStyle(
      fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
}
