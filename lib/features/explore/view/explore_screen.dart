import 'package:air_bnb_clone/core/constants/app_colors.dart';
import 'package:air_bnb_clone/core/constants/app_resource_path.dart';
import 'package:air_bnb_clone/features/explore/view/components/place_list_widget.dart';
import 'package:air_bnb_clone/features/explore/view/components/tab_icon.dart';
import 'package:air_bnb_clone/global_components/custom_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/map_icon_widget.dart';
import 'components/search_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 10, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        title: SearchWidget(ontap: () {}),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              tabAlignment: TabAlignment.start,
              splashFactory: NoSplash.splashFactory,
              unselectedLabelColor: TAppColors.black54,
              labelColor: TAppColors.black,
              indicatorColor: TAppColors.black,
              dividerColor: TAppColors.greyShade,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              tabs: [
                _tabBarItems(
                    iconPath: AppResourcePath.amazingPoolsIcon,
                    category: 'Amazing pool',
                    tabIndex: 0),
                _tabBarItems(
                    iconPath: AppResourcePath.iconssIcon,
                    category: 'Icons',
                    tabIndex: 1),
                _tabBarItems(
                    iconPath: AppResourcePath.amazingViewsIcon,
                    category: 'Amazing views',
                    tabIndex: 2),
                _tabBarItems(
                    iconPath: AppResourcePath.farmsIcon,
                    category: 'Farms',
                    tabIndex: 3),
                _tabBarItems(
                    iconPath: AppResourcePath.beachFrontIcon,
                    category: 'Beachfront',
                    tabIndex: 4),
                _tabBarItems(
                    iconPath: AppResourcePath.countrySideIcon,
                    category: 'Countryside',
                    tabIndex: 5),
                _tabBarItems(
                    iconPath: AppResourcePath.treeHouseIcon,
                    category: 'Treehouses',
                    tabIndex: 6),
                _tabBarItems(
                    iconPath: AppResourcePath.roomsIcon,
                    category: 'Rooms',
                    tabIndex: 7),
                _tabBarItems(
                  iconPath: AppResourcePath.castlesIcon,
                  category: 'Castles',
                  tabIndex: 8,
                ),
                _tabBarItems(
                    iconPath: AppResourcePath.omgIcon,
                    category: 'OMG!',
                    tabIndex: 9),
              ],
            )),
      ),
      body: SafeArea(
        child: CustomPaddingWidget(
          horizontal: 19.0,
          child: PlaceListWidget(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MapIconWidget(onTap: () {}),
    );
  }

  Widget _tabBarItems({
    required String iconPath,
    required String category,
    required int tabIndex,
  }) {
    return Tab(
      icon: TabIcon(
          iconPath: iconPath,
          tabIndex: tabIndex,
          tabController: _tabController),
      text: category,
    );
  }
}
