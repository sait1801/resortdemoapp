import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/login/login_controller.dart';
import 'package:resortdemo/src/app/login/widgets/input_text_field.dart';

Widget login(LoginController controller, Size size) {
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
              const Text(
                "Enjoy A Longer  And Healthy Life",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  inputTextField(controller, size),
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
          top: 0,
          left: 0,
          child: ElevatedButton(
            onPressed: () {
              controller.email = "s.burak2000@hotmail.com";
              controller.password = "asdasd";
              controller.chekIfUserOnFirestore("s.burak2000@hotmail.com");
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.white,
            ),
          )),
    ],
  );
}
