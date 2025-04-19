import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toastification/toastification.dart';
import 'core/constant/supabase.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/provider/login_provider.dart';
import 'features/auth/presentation/provider/register_provider.dart';
import 'routes/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      appBuilder: (BuildContext context, ThemeData theme) {
        return Builder(
          builder: (context) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => LoginProvider()),
                ChangeNotifierProvider(create: (_) => RegisterProvider()),
              ],
              child: ToastificationWrapper(
                child: MaterialApp.router(
                  title: 'AeroXpress',
                  theme: appThemeData,
                  debugShowCheckedModeBanner: false,
                  routerConfig: router,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
