import 'package:flutter/material.dart';
import 'package:flutter_aviasales_app/icons/custom_icons_icons.dart';
import 'package:flutter_aviasales_app/styles/color/colors.dart';
import 'package:flutter_aviasales_app/widgets/screens/bottom_nav_screens/aviasales_screen.dart';
import 'package:flutter_aviasales_app/widgets/screens/bottom_nav_screens/hotel_screen.dart';
import 'package:flutter_aviasales_app/widgets/screens/bottom_nav_screens/location_screen.dart';
import 'package:flutter_aviasales_app/widgets/screens/bottom_nav_screens/profile_screen.dart';
import 'package:flutter_aviasales_app/widgets/screens/bottom_nav_screens/subscription_screen.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;
  List<Widget> allScreens = const [
    AviasalesScreen(),
    HotelScreen(),
    LocationScreen(),
    SubscriptionScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: MyColors.specialBlue,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.airplane), label: 'Авиабилеты'),
          BottomNavigationBarItem(icon: Icon(CustomIcons.bed), label: 'Отели'),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.location), label: 'Короче'),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.notification), label: 'Подписки'),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.user), label: 'Профиль'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
