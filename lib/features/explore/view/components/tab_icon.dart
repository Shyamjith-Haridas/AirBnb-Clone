import 'package:air_bnb_clone/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabIcon extends StatelessWidget {
  const TabIcon({
    super.key,
    required this.iconPath,
    required this.tabIndex,
    required this.tabController,
  });

  final String iconPath;
  final int tabIndex;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tabController,
      builder: (context, child) {
        bool isSelected = tabController.index == tabIndex;

        return SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            isSelected ? TAppColors.black : TAppColors.black54,
            BlendMode.srcIn,
          ),
        );
      },
    );
  }
}
