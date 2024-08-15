
import 'package:flutter/material.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';

class ActiveChattingBox extends StatelessWidget {
  const ActiveChattingBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
  padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.symmetric( vertical: 8), 
             decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Padding(
        padding:  EdgeInsets.all(8.0),
        child: Text(
      "مرحبا بك  ماذل تريد ان تعرف",
          style: TextStyles.textStyle11,
        ),
      ),
    );
  }
}