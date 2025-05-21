import 'package:deal_sell/core/config/env_config.dart';
import 'package:deal_sell/core/services/cache_services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/provider/login_provider.dart';
import 'features/auth/presentation/provider/register_provider.dart';
import 'features/cutomers/profile/presentation/providers/theme_provider.dart';
import 'path/path.dart';
import 'routes/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //firebase initialized
  await Firebase.initializeApp();

  //Crashlytics initialized
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  //Enviroment Config
  EnvConfig.initialize(Environment.development);

  //Global SharedPreferences
  await CacheServices.instance.init();

  //

  runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));
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
                  title: 'Deal Sell',
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
