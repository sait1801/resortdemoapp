import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/home_controller.dart';

Widget bottomNavBar(HomeController controller, TabController tabController) {
  final _iconList = [
    Icons.home,
    Icons.search,
    Icons.forum,
    Icons.person,
    Icons.rate_review
  ];

  return MotionTabBar(
    initialSelectedTab: "Home",
    labels: const ["Home", "Search", "Forum", "Person", "RateReview"],
    icons: _iconList,
    tabSize: 50,
    tabBarHeight: 55,
    textStyle: const TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    tabIconColor: const Color(0xff274c69),
    tabIconSize: 28.0,
    useSafeArea: true,
    tabIconSelectedSize: 26.0,
    tabSelectedColor: const Color(0xff274c69),
    tabIconSelectedColor: Colors.white,
    tabBarColor: const Color(0xfffbfbfb),
    onTabItemSelected: (int value) {
      controller.bottomNavIndex = value;
    },
  );
}
