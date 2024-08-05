
import 'package:flutter/material.dart';
import 'package:my_pharmacy/core/app_colors.dart';
import 'package:my_pharmacy/core/text_styles.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Text(title,
    
      style: TextStyles.textStyle16.copyWith(
      color: AppColors.blackColor
      ),),
    );
  }
}