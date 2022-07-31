import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/constants_home.dart';
import 'package:resortdemo/src/app/login/login_controller.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

Widget inputTextField(LoginController controller, Size size,
    BuildContext context, String labelText) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 75,
    // padding: const EdgeInsets.all(20),
    child: ControlledWidgetBuilder<LoginController>(
        builder: (context, controller) {
      return TextField(
        onChanged: (text) {
          if (labelText == 'Mail') {
            controller.email = text;
          } else if ((labelText == 'Password')) {
            controller.password = text;
          } else if (labelText == 'First Name') {
            controller.name = text;
          } else if ((labelText == 'Last Name')) {
            controller.lastName = text;
          }
        },
        obscureText: labelText == "Password"
            ? true
            : false, //this must be visible later but that icon is not registerd here
        textAlignVertical: TextAlignVertical.center,
        maxLength: 50,
        expands: false,
        maxLines: 1,
        minLines: 1,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        cursorHeight: 30,
        showCursor: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          labelText: labelText,
          prefixIconColor: Colors.white,
          alignLabelWithHint: true,
        ),
      );
    }),
  );
}
