import 'package:air_bnb_clone/core/constants/app_colors.dart';
import 'package:air_bnb_clone/global_components/custom_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPaddingWidget(
          child: Column(
            children: [
              60.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  FaIcon(FontAwesomeIcons.bell, size: 30.h)
                ],
              ),
              30.verticalSpace,
              Row(
                children: [
                  Container(
                    height: 70.h,
                    width: 70.h,
                    decoration: BoxDecoration(
                      color: TAppColors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
