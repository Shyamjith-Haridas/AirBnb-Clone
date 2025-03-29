import 'package:air_bnb_clone/core/constants/app_colors.dart';
import 'package:air_bnb_clone/global_components/custom_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/login/view/components/divider_widget.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPaddingWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              80.verticalSpace,
              Text(
                "Trips",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              15.verticalSpace,
              CustomDividerWidget(),
              15.verticalSpace,
              Text(
                'No trips booked... yet!',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              10.verticalSpace,
              Text(
                  'Time to dust off your bags and start planning your next adventure'),
              20.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                decoration: BoxDecoration(
                  border: Border.all(color: TAppColors.black54),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Start searching',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              20.verticalSpace,
              CustomDividerWidget(),
              15.verticalSpace,
              Text('Can\'t find your reservation here?'),
              5.verticalSpace,
              Text(
                "Visit the Help Center",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
