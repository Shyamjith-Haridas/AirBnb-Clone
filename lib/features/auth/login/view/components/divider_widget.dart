import 'package:air_bnb_clone/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: TAppColors.grey,
        height: 1,
      ),
    );
  }
}
