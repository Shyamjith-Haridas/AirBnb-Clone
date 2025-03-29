import 'package:air_bnb_clone/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    super.key,
    required this.text,
    required this.socialIconPath,
    required this.onTap,
  });

  final String text;
  final String socialIconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: TAppColors.grey),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              socialIconPath,
              height: 24.h,
              width: 24.w,
            ),
            70.horizontalSpace,
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
