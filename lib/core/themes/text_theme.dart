import 'package:air_bnb_clone/core/constants/app_text_size.dart';
import 'package:flutter/material.dart';

class TAppTextTheme {
  static final TextTheme lightTextTheme = TextTheme(
    bodySmall: TextStyle(
      fontSize: TAppTextSize.fontSmall,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: TAppTextSize.fontMedium,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontSize: TAppTextSize.fontLarge,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: TAppTextSize.fontSmall,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      fontSize: TAppTextSize.fontMedium,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      fontSize: TAppTextSize.fontExtraLarge,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: TAppTextSize.fontSmall,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: TAppTextSize.fontMedium,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontSize: TAppTextSize.fontLarge,
      fontWeight: FontWeight.w700,
    ),
  );
}
