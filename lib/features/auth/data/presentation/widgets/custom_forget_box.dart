import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';

class CustomForgetBox extends StatelessWidget {
  const CustomForgetBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 45.w ,
      child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1), // Limit input to one digit
                  ],
                  textAlign: TextAlign.center, // Center align the text
                  style: const TextStyle(color: AppColors.whiteColor), // Set text color to white
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.whiteColor, // Background color of the text field
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0), // Border radius
                      borderSide: BorderSide.none,
                    ),
                    //contentPadding: const EdgeInsets.all(2.0), // Padding inside the TextField
                  ),
                ),
    );
            
  }
}
