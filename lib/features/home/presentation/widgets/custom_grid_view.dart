
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_pharmacy/features/home/data/models/category_model.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/category_view_item.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
 return StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 22.h,
      crossAxisSpacing: 12.h,
      axisDirection: AxisDirection.down,
      children: List.generate(
        categoryList.length,
        (index) =>  CategoryViewItem (category: categoryList[index],),
      ),
    ); 
     }
}