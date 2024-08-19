import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/services/service_locator.dart';
import 'package:my_pharmacy/features/auth/presentation/views/forget_password_frist.dart';
import 'package:my_pharmacy/features/auth/presentation/views/forget_password_second.dart';
import 'package:my_pharmacy/features/auth/presentation/views/forget_password_three.dart';
import 'package:my_pharmacy/features/auth/presentation/views/sign_in_view.dart';
import 'package:my_pharmacy/features/auth/presentation/views/sign_up_view.dart';
import 'package:my_pharmacy/features/chat/data/models/chat_model.dart';
import 'package:my_pharmacy/features/chat/presentation/views/conversation_view.dart';
import 'package:my_pharmacy/features/dashboard/presentation/cubit/firestore_cubit.dart';
import 'package:my_pharmacy/features/dashboard/presentation/views/add_data_view.dart';
import 'package:my_pharmacy/features/home/data/models/category_model.dart';
import 'package:my_pharmacy/features/home/data/models/pharmacy_model.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_pharmacy/features/cart/presentation/views/address_saved_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/categories_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/category_details_view.dart';
import 'package:my_pharmacy/features/chat/presentation/views/chatting_view.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/views/nearest_pharmacy_view.dart';
import 'package:my_pharmacy/features/offer/view/offer_view.dart';
import 'package:my_pharmacy/features/cart/presentation/views/payment_view.dart';
import 'package:my_pharmacy/features/profile/presentation/views/personal_info_view.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/views/pharmacy_details_view.dart';
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
      builder: (context, state) => SignInView(),
    ),
    GoRoute(
      path: RoutesNames.kSigUpView,
      builder: (context, state) => SignUpView(),
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
      builder: (context, state) => const RootView(),
    ),
    GoRoute(
        path: RoutesNames.kNearestPharmacyView,
        builder: (context, state) {
          return const NearestPharmacyView();
        }),
    GoRoute(
        path: RoutesNames.kOffer50View,
        builder: (context, state) => const Offer50View()),
    GoRoute(
        path: RoutesNames.kCategoryView,
        builder: (context, state) => const CategoriesView()),
    GoRoute(
        path: RoutesNames.kCategoryDetailsView,
        builder: (context, state) {
          final category =
              state.extra as CategoryModel; // Retrieve the object here
          return CategoryDetailsView(
            category: category,
          );
        }),
    GoRoute(
        path: RoutesNames.kPharmacyDetailsView,
        builder: (context, state) {
          final nearestPharmacy =
              state.extra as PharmacyModel; // Retrieve the object here
          return BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: PharmacyDetailsView(
                nearestPharmacy:
                    nearestPharmacy), // Pass the object to the page
          );
        }),
    // Pass the object to the page

    GoRoute(
        path: RoutesNames.kChattingView,
        builder: (context, state) {
          final chat = state.extra as ChatModel; // Retrieve the object here
          return ChattingView(
            chat: chat,
          );
        }),
    GoRoute(
        path: RoutesNames.kConversationView,
        builder: (context, state) => const ConversationView()),
    GoRoute(
        path: RoutesNames.kPaymentView,
        builder: (context, state) => const PaymentView()),
    GoRoute(
        path: RoutesNames.kPersonalInfoView,
        builder: (context, state) => const PersonalInfoView()),
    GoRoute(
        path: RoutesNames.kAddressSavedView,
        builder: (context, state) => const AddressSavedView()),
    GoRoute(
        path: RoutesNames.kaddData,
        builder: (context, state) => BlocProvider(
              create: (context) => getIt<FirestoreCubit>(),
              child: AddDataScreen(),
            )),
  ]);
}
