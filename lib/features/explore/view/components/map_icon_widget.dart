import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class MapIconWidget extends StatelessWidget {
  const MapIconWidget({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          elevation: 0, backgroundColor: TAppColors.black),
      child: Row(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Map',
            style: TextStyle(
              fontSize: 16.sp,
              color: TAppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(
            Icons.map,
            color: TAppColors.white,
          ),
        ],
      ),
    );
  }
}
