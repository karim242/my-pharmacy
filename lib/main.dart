import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
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
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp.router(

        routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
  locale: const Locale('ar'), // Set default locale to Arabic
      localizationsDelegates:const [
       // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:const [
         Locale('en', ''),
         Locale('ar', ''),
      ],
       theme: ThemeData(
          fontFamily: 'Cairo',
        ),
    );
   }
    );
  }
}