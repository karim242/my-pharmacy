import 'package:flutter/material.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';

class TitleText extends StatelessWidget {
   const TitleText({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyles.textStyle16.copyWith(color: AppColors.blackColor),
        ),
      
    );
  }
}
