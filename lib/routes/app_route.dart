import 'package:deal_sell/core/services/once_cache_service.dart';
import 'package:deal_sell/features/auth/presentation/screens/forget_password.dart';

import '../core/dl/dependency_injection.dart';
import '../features/cutomers/profile/presentation/screens/help_center_screen.dart';
import '../features/cutomers/profile/presentation/screens/theme_screen.dart';
import '../features/on_boarding/on_boarding_screen.dart';
import '../features/splash_screen/splash_screen.dart';
import '../path/path.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/cutomers/bottom_nav_bar/bottom_nav_bar.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'SplashScreen',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/onBoardingScreen',
      name: 'onBoardingScreen',
      redirect: (context, state) async {
        final isOnBoardingCompleted =
            await sl<OnceCacheService>().getOnBoardingCache();

        if (isOnBoardingCompleted != null) {
          return '/loginScreen';
        }
        return null;
      },
      builder: (context, state) => OnBoardingScreen(),
    ),
    GoRoute(
      path: '/bottomNav',
      name: 'bottomNav',
      builder: (context, state) => BottomNavBarScreen(),
    ),
    GoRoute(
      path: '/loginScreen',
      name: 'loginScreen',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/registerScreen',
      name: 'registerScreen',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/forgetPassword',
      name: 'forgetPassword',
      builder: (context, state) => ForgetPasswordScreen(),
    ),
    GoRoute(
      path: '/themeSelectorScreen',
      name: 'ThemeSelectorScreen',
      builder: (context, state) => ThemeSelectorScreen(),
    ),
    GoRoute(
      path: '/helpCenter',
      name: 'HelpCenter',
      builder: (context, state) => HelpCenterScreen(),
    ),
  ],
);
