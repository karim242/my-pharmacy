import 'package:flutter/material.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/features/home/presentation/view/cart_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/conversation_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/home_view.dart';
import 'package:my_pharmacy/features/home/presentation/view/setting_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _selectedIndex = 3;
  static const List<Widget> _widgetOptions = <Widget>[
    SettingView(),
    ConversationView(),
    CartView(),
    HomeView(),
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
      bottomNavigationBar:  ClipRRect(
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
            backgroundColor:AppColors.primaryColor,
            unselectedItemColor: AppColors.secondColor,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "setting"),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.solidComments), label: "cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "chat"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            ],
          ),
        ),
     // ),
    );
  }
}
