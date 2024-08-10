
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';

class CustomBackGround extends StatelessWidget {
  const CustomBackGround({

    super.key, required this.child,
  });
final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
              
              child: Image.asset(
                AppImages.backgroundAuth,
                height: 264.h,
                fit: BoxFit.cover,
                color: AppColors.primaryColor,
              )),
          Positioned(
            
            child: Image.asset(
              AppImages.shadow,
              height: 264.h,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(right: 38.0,left: 38.0,top:86.0.h),
            child:AnimatedCrossFade(
                firstChild: const SizedBox(), 
                secondChild: child,
                 crossFadeState: CrossFadeState.showSecond,
                  duration: const Duration(seconds: 1),)
          ),
        ],
      ),
    );
  }
}