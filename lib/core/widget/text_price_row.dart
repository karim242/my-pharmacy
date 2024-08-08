import 'package:flutter/material.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';

class TextAndPriceRow extends StatelessWidget {
  const TextAndPriceRow({
    super.key,required this.title, required this.price,
  });

  final String title;
  final double price;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
         title,
          style: TextStyles.textStyle12.copyWith(
            color: AppColors.blackColor
          )
        ),
        SizedBox(
          //height: 44,
          width: 176,
          child: Text(
            price.toString(),
            textAlign: TextAlign.end,
style: TextStyles.textStyle12.copyWith(
            color: AppColors.blackColor
          )                
          ),
        ),
      ],
    );
  }
}