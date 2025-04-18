import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      appBuilder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          title: 'AeroXpress',
          theme: appThemeData,
          debugShowCheckedModeBanner: false,
          home: AuthScreen(),
        );
      },
    );
  }
}
