import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/app_colors.dart';
import 'package:my_pharmacy/core/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});

  final String labelText;
  final int maxLines;

  final void Function(String?)? onSaved;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        style: const TextStyle(color: AppColors.whiteColor),
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required ';
          } else {
            return null;
          }
        },
        cursorColor: AppColors.whiteColor,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
         
         
          labelStyle: TextStyles.textStyle12,
          fillColor: AppColors.whiteColor,
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: AppColors.whiteColor,
        ));
  }
}
