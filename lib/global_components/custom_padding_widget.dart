// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPaddingWidget extends StatelessWidget {
  CustomPaddingWidget({
    super.key,
    required this.child,
    this.vertical = 0,
    this.horizontal = 19,
  });

  final Widget child;
  double horizontal;
  double vertical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal.w,
      ),
      child: child,
    );
  }
}
