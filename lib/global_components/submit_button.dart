import 'package:air_bnb_clone/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: 1.sw,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: TAppColors.primaryColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          buttonText,
          style: TextStyle(color: TAppColors.white),
        ),
      ),
    );
  }
}
