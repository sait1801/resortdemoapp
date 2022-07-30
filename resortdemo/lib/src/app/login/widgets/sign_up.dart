import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/login/login_controller.dart';
import 'package:resortdemo/src/app/login/widgets/login.dart';

Widget signUp(LoginController controller, Size size, BuildContext context) {
  return login(controller, size, context, false);
}
