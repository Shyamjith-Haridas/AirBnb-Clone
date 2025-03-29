import 'dart:async';

import 'package:air_bnb_clone/config/routes/app_route_names.dart';
import 'package:air_bnb_clone/core/constants/app_resource_path.dart';
import 'package:air_bnb_clone/core/settings/shared_pref.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _splashFucntion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppResourcePath.splashGif),
      ),
    );
  }

  void _splashFucntion() async {
    Timer(const Duration(seconds: 4), () {
      checkUserSession();
    });
  }

  void checkUserSession() async {
    final activeSession = await SessionManager.getUserSession();

    if (activeSession != null && activeSession['isLoggedIn'] != null) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRouteNames.bottomNavScreen);
    } else {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRouteNames.loginScreen);
    }
  }
}
