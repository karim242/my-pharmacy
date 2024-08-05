import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/features/auth/data/presentation/views/forget_password_frist.dart';
import 'package:my_pharmacy/features/auth/data/presentation/views/forget_password_second.dart';
import 'package:my_pharmacy/features/auth/data/presentation/views/forget_password_three.dart';
import 'package:my_pharmacy/features/auth/data/presentation/views/sign_in_view.dart';
import 'package:my_pharmacy/features/auth/data/presentation/views/sign_up_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/root_view.dart';
import 'package:my_pharmacy/features/splash/view/splash_view.dart';

abstract class AppRouter {
  static const String kSplashView = '/';
  static const String kSiginView = '/siginView';
  static const String kSigUpView  = '/signUpView';
  static const String kForgetPassOne  = '/ForgetPasswordFrist';
  static const String kForgetPassTwo  = '/ForgetPasswordSecond';
  static const String kForgetPassThree  = '/ForgetPasswordThree';
  static const String kRootView  = '/RootView';



  static final router = GoRouter(routes: [
    GoRoute(
      path: kSplashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kSiginView,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: kSigUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: kForgetPassOne,
      builder: (context, state) => const ForgetPasswordFrist(),
    ),
    GoRoute(
      path: kForgetPassTwo,
      builder: (context, state) => const ForgetPasswordSecond(),
    ),
     GoRoute(
      path: kForgetPassThree,
      builder: (context, state) => const ForgetPasswordThree()
    ),
      GoRoute(
      path: kRootView,
      builder: (context, state) => const RootView()
    ),
   
  ]);
}