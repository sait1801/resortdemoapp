import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/home_controller.dart';

Widget topImage(HomeController controller, Size size) {
  return SizedBox(
    width: size.width,
    height: size.height * 0.4,
    child: Image.asset("assets/images/home.jpg"),
  );
}
