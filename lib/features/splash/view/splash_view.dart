import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToAuth();
  }

  _navigateToAuth() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      GoRouter.of(context).push(RoutesNames.kSiginView);
    }); // Delay for 3 seconds
    // Navigate to the main screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: AnimatedCrossFade(
            firstChild: const SizedBox(),
            secondChild: Image.asset(AppImages.logo),
            crossFadeState: CrossFadeState.showSecond,
            duration: const Duration(seconds: 1),
          )),
        ],
      ),
    );
  }
}
//  Image.asset('assets/images/logo.png'),