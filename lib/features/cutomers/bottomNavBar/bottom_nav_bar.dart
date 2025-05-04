import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/widget/badge.dart';
import '../cart/presentation/screens/cart_screen.dart';
import '../category/presentation/screens/category_screen.dart';
import '../home/presentation/screen/home_screen.dart';
import '../profile/presentation/screens/profile_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Material(
        elevation: 8,
        child: BottomNavigationBar(
          // selectedLabelStyle: ,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/home.svg'),
              activeIcon: SvgPicture.asset('assets/svg/home_bold.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/category.svg'),
              activeIcon: SvgPicture.asset('assets/svg/category_bold.svg'),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: CustomBadge(
                count: '4',
                child: SvgPicture.asset('assets/svg/cart.svg'),
              ),
              activeIcon: CustomBadge(
                count: '4',
                child: SvgPicture.asset('assets/svg/cart_bold.svg'),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/profile.svg'),
              activeIcon: SvgPicture.asset('assets/svg/profile_bold.svg'),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
