import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/home_controller.dart';

Widget bottomNavBar(HomeController controller) {
  final _iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.message,
  ];

  return AnimatedBottomNavigationBar(
    icons: _iconList,
    backgroundColor: const Color(0xff21355C),
    activeIndex: controller.bottomNavIndex,
    gapLocation: GapLocation.end,
    notchSmoothness: NotchSmoothness.verySmoothEdge,
    leftCornerRadius: 12,
    rightCornerRadius: 0,
    onTap: (index) => controller.bottomNavIndex = index,

    //other params
  );
}
