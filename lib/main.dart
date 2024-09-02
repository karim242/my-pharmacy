import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/routes/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_pharmacy/core/services/service_locator.dart';
import 'package:my_pharmacy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_pharmacy/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:my_pharmacy/features/category/presentation/cubit/category_cubit.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:my_pharmacy/features/offer/presentation/cubit/offer_cubit.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_cubit.dart';
import 'package:my_pharmacy/firebase_options.dart';
import 'package:my_pharmacy/generated/l10n.dart';

import 'features/home/presentation/cubit/all_product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();

  runApp(const Mypharmacy());
}

class Mypharmacy extends StatelessWidget {
  const Mypharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      getIt<CategoriesCubit>()..loadCategories()),
              BlocProvider(
                  create: (context) => getIt<PharmacyCubit>()..loadPharmacy()),
              BlocProvider(
                  create: (context) =>
                      getIt<OfferCubit>()..loadOfferPharmacy()),
              BlocProvider(
                  create: (context) => getIt<CartCubit>()..loadCartItems()),
              BlocProvider(create: (context) => getIt<ProductCubit>()),
              BlocProvider(
                  create: (context) => getIt<ChatCubit>()..fetchChats()),
              BlocProvider(create: (context) => getIt<AuthCubit>()),
            ],
            child: MaterialApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              locale: const Locale('ar'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('ar', ''),
              ],
              theme: ThemeData(
                fontFamily: 'Cairo',
              ),
            ),
          );
        });
  }
}
