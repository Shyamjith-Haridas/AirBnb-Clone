import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: TAppColors.grey);
  }
}
