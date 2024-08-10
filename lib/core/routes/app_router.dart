import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/features/auth/presentation/views/forget_password_frist.dart';
import 'package:my_pharmacy/features/auth/presentation/views/forget_password_second.dart';
import 'package:my_pharmacy/features/auth/presentation/views/forget_password_three.dart';
import 'package:my_pharmacy/features/auth/presentation/views/sign_in_view.dart';
import 'package:my_pharmacy/features/auth/presentation/views/sign_up_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/address_saved_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/categories_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/category_details_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/chatting_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/nearest_pharmacy_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/offer_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/payment_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/personal_info_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/pharmacy_details_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/root_view.dart';
import 'package:my_pharmacy/features/splash/view/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: RoutesNames.kSplashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RoutesNames.kSiginView,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: RoutesNames.kSigUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: RoutesNames.kForgetPassOne,
      builder: (context, state) => const ForgetPasswordFrist(),
    ),
    GoRoute(
      path: RoutesNames.kForgetPassTwo,
      builder: (context, state) => const ForgetPasswordSecond(),
    ),
    GoRoute(
        path: RoutesNames.kForgetPassThree,
        builder: (context, state) => const ForgetPasswordThree()),
    GoRoute(
        path: RoutesNames.kRootView,
        builder: (context, state) => const RootView()),
    GoRoute(
        path: RoutesNames.kNearestPharmacyView,
        builder: (context, state) => const NearestPharmacyView()),
    GoRoute(
        path: RoutesNames.kOffer50View,
        builder: (context, state) => const Offer50View()),
    GoRoute(
        path: RoutesNames.kCategoryView,
        builder: (context, state) => const CategoriesView()),
    GoRoute(
        path: RoutesNames.kCategoryDetailsView,
        builder: (context, state) => const CategoryDetailsView()),
    GoRoute(
        path: RoutesNames.kPharmacyDetailsView,
        builder: (context, state) => const PharmacyDetailsView()),
    GoRoute(
        path: RoutesNames.kChattingView,
        builder: (context, state) => const ChattingView()),
    GoRoute(
        path: RoutesNames.kPaymentView,
        builder: (context, state) => const PaymentView()),
    GoRoute(
        path: RoutesNames.kPersonalInfoView,
        builder: (context, state) => const PersonalInfoView()),
    GoRoute(
        path: RoutesNames.kAddressSavedView,
        builder: (context, state) => const AddressSavedView()),
  ]);
}
