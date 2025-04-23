import 'package:aero_xpress/features/bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/screens/auth_screen.dart';
import '../features/auth/presentation/screens/verify_with_otp_screen.dart';
import '../features/users/home_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'AuthScreen',
      builder: (context, state) => AuthScreen(),
    ),
    GoRoute(
      path: '/HomeScreen',
      name: 'HomeScreen',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/VerifyOTP',
      name: 'VerifyOTP',
      builder: (context, state) => VerifyWithOtpScreen(),
    ),
    GoRoute(
      path: '/BottomNavBar',
      name: 'BottomNavBar',
      builder: (context, state) => CustomNavBarDemo(),
    ),
  ],
);
