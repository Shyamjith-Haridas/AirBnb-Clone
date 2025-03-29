import 'package:air_bnb_clone/core/constants/app_colors.dart';
import 'package:air_bnb_clone/core/constants/app_resource_path.dart';
import 'package:air_bnb_clone/features/explore/view/explore_screen.dart';
import 'package:air_bnb_clone/features/messages/views/message_screen.dart';
import 'package:air_bnb_clone/features/profile/views/profile_screen.dart';
import 'package:air_bnb_clone/features/trips/view/trips_screen.dart';
import 'package:air_bnb_clone/features/wishlists/view/wishlists_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  List<Widget> screens = [
    ExploreScreen(),
    WishlistsScreen(),
    TripsScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  void dispose() {
    currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, notifierSnapshot, _) {
          return screens[currentIndex.value];
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: TAppColors.greyShade),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: TAppColors.white,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 05.h),
            child: ValueListenableBuilder<int>(
              valueListenable: currentIndex,
              builder: (context, notifierSnaphot, _) {
                return BottomNavigationBar(
                  currentIndex: currentIndex.value,
                  onTap: (value) => currentIndex.value = value,
                  items: _bottomNavItems(),
                  enableFeedback: true,
                  selectedFontSize: 12.sp,
                  unselectedFontSize: 12.sp,
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: TAppColors.black,
                  selectedItemColor: TAppColors.primaryColor,
                  selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomNavItems() {
    return [
      _navItems(
        icon: AppResourcePath.exploreInactiveIcon,
        activeIcon: AppResourcePath.exploreActiveIcon,
        label: 'Explore',
      ),
      _navItems(
        icon: AppResourcePath.wishListInactiveIcon,
        activeIcon: AppResourcePath.wishListActiveIcon,
        label: 'Wishlists',
      ),
      _navItems(
        icon: AppResourcePath.tripInactiveIcon,
        activeIcon: AppResourcePath.tripActiveIcon,
        label: 'Trips',
      ),
      _navItems(
        icon: AppResourcePath.messageInactiveIcon,
        activeIcon: AppResourcePath.messageActiveIcon,
        label: 'Messages',
      ),
      _navItems(
        icon: AppResourcePath.profileInactiveIcon,
        activeIcon: AppResourcePath.profileActiveIcon,
        label: 'Profiles',
      ),
    ];
  }

  BottomNavigationBarItem _navItems(
      {required String icon,
      required String activeIcon,
      required String label}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon),
      activeIcon: SvgPicture.asset(activeIcon),
      label: label,
    );
  }
}
