import 'package:flutter/material.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/change_password_sheet.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/payment_textfield.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleText(
          title: AppStrings.kPersonalInfoString,
        ),
        backgroundColor: Colors.white,
        elevation: 0,

        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        //actions: [
        //    Icon(Icons.more_vert, color: Colors.black),
        //  ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const PaymentTextField(hintText: AppStrings.kName),
            const SizedBox(height: 10),
            const PaymentTextField(hintText: AppStrings.kPhone),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0)),
                  ),
                  builder: (context) => const ChangePasswordSheet(),
                );
              },
              child: const Text(
                'تغيير كلمة المرور',
                style: TextStyle(color: Colors.blue, fontSize: 16),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
