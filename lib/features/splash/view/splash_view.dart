import 'package:firebase_auth/firebase_auth.dart';
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
    _checkLoginStatusAndNavigate();
  }

  Future<bool> isUserLoggedIn() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    return user != null;
  }

  Future<void> _checkLoginStatusAndNavigate() async {
    bool loggedIn = await isUserLoggedIn();
    if (loggedIn) {
      context.go(RoutesNames.kRootView);
    } else {
      context.go(RoutesNames.kSiginView);
    }
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
