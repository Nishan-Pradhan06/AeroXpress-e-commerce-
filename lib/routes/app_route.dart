import '../path/main.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/bottomNavBar/bottom_nav_bar.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'BottomNavBarScreen',
      builder: (context, state) => BottomNavBarScreen(),
    ),
    GoRoute(
      path: 'loginScreen',
      name: 'LoginScreen',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: 'register-screen',
      name: 'RegisterScreen',
      builder: (context, state) => RegisterScreen(),
    ),
  ],
);
