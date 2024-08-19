import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/custom_search_box.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.0.w),
          child: const CustomSearchBox(),
        ),

        SvgPicture.asset(
          AppImages.handBagIcon,
        ),
        // const SizedBox(width: 8),
        //
      ],
    );
  }
}
