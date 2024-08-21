import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';

class CustomLoginRow extends StatelessWidget {
  const CustomLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.kNotHaveAccount(context),
          style: TextStyles.textStyle10,
        ),
        GestureDetector(
            onTap: () {
              GoRouter.of(context).push(RoutesNames.kSigUpView);
            },
            child: Text(
              AppStrings.kCreateAccount(context),
              style: TextStyles.textStyle10.copyWith(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.whiteColor),
            ))
      ],
    );
  }
}
