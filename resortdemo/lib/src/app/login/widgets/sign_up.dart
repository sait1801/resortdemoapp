import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/login/login_controller.dart';

Widget signUp(LoginController controller) {
  return Stack(
    children: [
      Positioned(
          top: 0,
          left: 0,
          child: Image.asset("assets/images/login_background.jpg")),
      Positioned(
        top: 100,
        left: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    controller.email = "s.burak2001@hotmail.com";
                    controller.password = "asdasd";
                    controller.chekIfUserOnFirestore(controller.email);
                  },
                  child: Container(
                    color: Colors.yellow,
                    width: 50,
                    height: 50,
                  ))
            ],
          ),
        ),
      )
    ],
  );
}
