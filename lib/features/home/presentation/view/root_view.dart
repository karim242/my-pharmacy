import 'package:flutter/material.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/features/cart/presentation/views/cart_view.dart';
import 'package:my_pharmacy/features/chat/presentation/views/conversation_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/home_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/setting_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/features/offer/presentation/cubit/offer_cubit.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_cubit.dart';
import '../../../../core/services/service_locator.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../category/presentation/cubit/category_cubit.dart';
import '../../../chat/presentation/cubit/chat_cubit.dart';
import '../cubit/all_product_cubit.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..loadCategories(),
        ),
        BlocProvider(
            create: (context) => getIt<PharmacyCubit>()..loadPharmacy()),
        BlocProvider(
            create: (context) => getIt<OfferCubit>()..loadOfferPharmacy()),
        BlocProvider(create: (context) => getIt<ProductCubit>()),
      ],
      child: const HomeView(),
    ),
    BlocProvider(
      create: (context) => getIt<CartCubit>()..loadCartItems(),
      child: const CartView(),
    ),
    BlocProvider(
      create: (context) => getIt<ChatCubit>()..loadChats(),
      child: const ConversationView(),
    ),
    BlocProvider(
        create: (context) => getIt<AuthCubit>(),
      child: const SettingView(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false, // Hide selected labels
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.secondColor,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "chat"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidComments), label: "cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "setting"),
          ],
        ),
      ),
      // ),
    );
  }
}
