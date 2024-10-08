import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';

class PriceBox extends StatelessWidget {
  const PriceBox({
    super.key,
    required this.price,
  });
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 75.w,
        height: 30.h,
        decoration: const BoxDecoration(
          color: Color(0xffE1D8C3),
          borderRadius: BorderRadius.only(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'EGP ',
              style: TextStyles.textStyle11
                  .copyWith(color: AppColors.primaryColor),
            ),
            Text(
              price,
              style: TextStyles.textStyle16
                  .copyWith(color: AppColors.primaryColor),
            ),
          ],
        ));
  }
}
