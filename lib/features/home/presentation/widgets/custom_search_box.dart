import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/app_colors.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 32.h,
            width: 258.w,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(color:AppColors.primaryColor),
          ),
          hintText: 'بحث',
          prefixIcon: Icon(Icons.search,color: AppColors.secondColor,)
         
        ),
      ),
    );
  }
}