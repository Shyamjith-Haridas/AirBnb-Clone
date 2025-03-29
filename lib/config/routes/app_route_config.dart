import 'package:air_bnb_clone/bottom_nav.dart';
import 'package:air_bnb_clone/config/routes/app_route_names.dart';
import 'package:air_bnb_clone/features/auth/login/view/login_screen.dart';
import 'package:air_bnb_clone/features/auth/login/view/otp_verification_screen.dart';
import 'package:air_bnb_clone/features/auth/splash/view/splash_screen.dart';
import 'package:air_bnb_clone/features/explore/view/explore_screen.dart';
import 'package:air_bnb_clone/features/place_details/view/place_details_screen.dart';
import 'package:flutter/material.dart';

class AppRouteConfig {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );

      case AppRouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );

      case AppRouteNames.otpVerificationScreen:
        final mobileNumber = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) =>
              OtpVerificationScreen(mobileNumber: mobileNumber),
        );

      case AppRouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => ExploreScreen(),
        );

      case AppRouteNames.bottomNavScreen:
        return MaterialPageRoute(
          builder: (context) => BottomNav(),
        );

      case AppRouteNames.placeDetailScreen:
        return MaterialPageRoute(
          builder: (context) => PlaceDetailsScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text("No route found.."),
              ),
            );
          },
        );
    }
  }
}
