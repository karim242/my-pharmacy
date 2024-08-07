import 'package:flutter/material.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';

class TextAndPriceRow extends StatelessWidget {
  const TextAndPriceRow({
    super.key,
     this.textColor, this.fontWeigh,
  });
  final Color? textColor;
 final FontWeight? fontWeigh;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "totalPrice.title",
          style: TextStyles.textStyle12.copyWith(
            color: AppColors.blackColor
          )
        ),
        SizedBox(
          //height: 44,
          width: 176,
          child: Text(
            "price",
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