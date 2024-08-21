import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';

class CallUsBtn extends StatelessWidget {
  const CallUsBtn({
    super.key,
    this.onTap,
    this.width = 143,
    this.height = 34,
  });
  final void Function()? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.w,
        height: height?.h,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Text(
            AppStrings.kCallUs(context),
            style: TextStyles.textStyle11.copyWith(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
