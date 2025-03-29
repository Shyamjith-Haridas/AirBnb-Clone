import 'package:air_bnb_clone/core/constants/app_colors.dart';
import 'package:air_bnb_clone/core/themes/app_bar_theme.dart';
import 'package:air_bnb_clone/core/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: TAppColors.white,
    appBarTheme: TAppBarTheme.appBarTheme,
    textTheme: TAppTextTheme.lightTextTheme,
  );
}
