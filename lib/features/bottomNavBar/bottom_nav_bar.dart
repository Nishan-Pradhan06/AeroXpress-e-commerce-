import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../cutomers/favourites_screen.dart';
import '../cutomers/home_screen.dart';
import '../cutomers/profile_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    FavouritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Material(
        elevation: 8,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/Home.svg'),
              activeIcon: SvgPicture.asset('assets/svg/Home-bold.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/Heart.svg'),
              activeIcon: SvgPicture.asset('assets/svg/Heart-bold.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/Profile.svg'),
              activeIcon: SvgPicture.asset('assets/svg/Profile-bold.svg'),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
