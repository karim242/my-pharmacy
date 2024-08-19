import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/custom_search_box.dart';

import 'package:flutter/material.dart';

class InnerSearchRow extends StatelessWidget {
  const InnerSearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            // ignore: prefer_const_constructors
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 19,
            )),
        Padding(
          padding: EdgeInsets.only(right: 3.0.w),
          child: const CustomSearchBox(),
        ),
      ],
    );
  }
}
