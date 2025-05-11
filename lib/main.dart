import 'core/theme/app_theme.dart';
import 'features/auth/presentation/provider/login_provider.dart';
import 'features/auth/presentation/provider/register_provider.dart';
import 'features/cutomers/profile/presentation/providers/theme_provider.dart';
import 'path/path.dart';
import 'routes/app_route.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      appBuilder: (BuildContext context, ThemeData theme) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LoginProvider()),
            ChangeNotifierProvider(create: (_) => RegisterProvider()),
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return ToastificationWrapper(
                child: MaterialApp.router(
                  title: 'AeroXpress',
                  theme: appThemeData,
                  themeAnimationCurve: Curves.easeInOut,
                  themeAnimationStyle: AnimationStyle(curve: Curves.bounceIn),
                  debugShowCheckedModeBanner: false,
                  routerConfig: router,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
