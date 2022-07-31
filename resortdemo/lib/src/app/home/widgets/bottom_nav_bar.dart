import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/home_controller.dart';
import 'package:resortdemo/src/app/navigation_helper.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../forum/forum_controller.dart';
import '../../login/login_controller.dart';

Widget bottomNavBar(
    TabController tabController, BuildContext context, int index) {
  final _iconList = [
    Icons.rate_review,
    Icons.home,
    Icons.person,
  ];

  List<String> labels = const ["Forum", "Home", "Person"];

  return MotionTabBar(
      initialSelectedTab: labels[index],
      labels: labels,
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
        if (value == 0 || tabController.index != value) {
          tabController.index = 0;
          NavigationHelper.navigateToForumView(context);
        } else if (value == 1 || tabController.index != value) {
          tabController.index = 1;

          NavigationHelper.navigateToHomeScreen(context);
        } else {
          tabController.index = 2;
        }
      });
}
