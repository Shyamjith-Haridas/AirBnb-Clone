// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({
    super.key,
    this.onTap,
  });

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap ??
          () {
            Navigator.pop(context);
          },
      icon: Icon(
        Icons.arrow_back_ios_new_outlined,
        size: 20.sp,
      ),
    );
  }
}
