import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/auth/presentation/cubit/auth_cubit.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool _isSwitchedOn = true; // Initial state of the switch

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitchedOn = value;
      // Add your logic here for what should happen when the switch is toggled
      if (_isSwitchedOn) {
        // print('Notifications turned on');
      } else {
        //  print('Notifications turned off');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Removes the back button

        title:  TitleText(title: AppStrings.kSetting(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.arrow_back_ios),
              title:  Text(AppStrings.kPersonalInfoString(context)),
              onTap: () {
                GoRouter.of(context).push(RoutesNames.kPersonalInfoView);
                // Handle navigation to personal information screen
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.arrow_back_ios),
              title: Text(AppStrings.kSaveTitle(context)),
              onTap: () {
                // Handle navigation to saved addresses screen
                GoRouter.of(context).push(RoutesNames.kAddressSavedView);
              },
            ),
            const Divider(),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.kNotifications(context)),
                Switch(value: _isSwitchedOn, onChanged: _toggleSwitch),
              ],
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle logout action
                  BlocProvider.of<AuthCubit>(context).signOut();
                  GoRouter.of(context).replace(RoutesNames.kSplashView);
                },
                child: Text(
                  AppStrings.kSignOut(context),
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
