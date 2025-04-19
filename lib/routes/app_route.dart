import 'package:go_router/go_router.dart';
import '../features/auth/presentation/screens/auth_screen.dart';
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
      path: '/home',
      name: 'HomeScreen',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
