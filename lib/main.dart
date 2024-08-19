import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/routes/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_pharmacy/core/services/service_locator.dart';
import 'package:my_pharmacy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_pharmacy/firebase_options.dart';

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
                create: (context) {
                  return getIt<ChatCubit>()..loadChats();
                },
              ),
              BlocProvider(
                create: (context) => getIt<HomeCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<AuthCubit>(),
              ),
            ],
            child: MaterialApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              locale: const Locale('ar'),
              localizationsDelegates: const [
                // AppLocalizations.delegate,
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
