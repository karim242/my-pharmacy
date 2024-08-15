import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';

class ListTileInDetailView extends StatelessWidget {
  const ListTileInDetailView({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 24,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyles.textStyle12.copyWith(color: AppColors.blackColor),
          ),
        ),
      ],
    );
  }
}
