import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/home_controller.dart';

Widget topImage(HomeController controller, Size size) {
  bool isVillaView = (controller.topImagePath == null);
  return SizedBox(
    width: size.width,
    height: isVillaView ? size.height * 0.15 : size.height * 0.4,
    child: isVillaView
        ? Image.asset("assets/images/home.jpg")
        : Image.asset(controller.topImagePath!),
  );
}
