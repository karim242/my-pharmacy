import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';

class NearestPharmacyItem extends StatelessWidget {
  const NearestPharmacyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 70.w,
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              AppImages.elezabyImage, //Replace with your SVG image path
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(6.0),
          child: Text(
            'العزبي' ,
            style: TextStyles.textStyle14,
         
        )
        ),
       const Text(
            ' 25 دقيقة'  ,
            style: TextStyles.textStyle9,
          ),
           
      ],
    );
  }
}
