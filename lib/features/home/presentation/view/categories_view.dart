import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/custom_category_grid_view.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/inner_search_row.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 38.0.w, left: 38.0.w, top: 50.0.h),
        child: SingleChildScrollView(
          child: Column(children: [
            const InnerSearchRow(),
            SizedBox(
              height: 15.h,
            ),
            // const TitleText(
            //   title: 'مستحضرات التجميل',
            // ),
            SizedBox(height: 15.0.h),
            const CategoriesGridView()
          ]),
        ),
      ),
    );
  }
}
