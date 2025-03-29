import 'package:air_bnb_clone/config/routes/app_route_config.dart';
import 'package:air_bnb_clone/config/routes/app_route_names.dart';
import 'package:air_bnb_clone/core/themes/app_theme.dart';
import 'package:air_bnb_clone/features/auth/splash/view/splash_screen.dart';
import 'package:air_bnb_clone/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (context, _) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          home: SplashScreen(),
          initialRoute: AppRouteNames.splashScreen,
          onGenerateRoute: AppRouteConfig.onGenerateRoutes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
