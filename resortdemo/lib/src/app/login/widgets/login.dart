import 'package:flutter/material.dart';
import 'package:resortdemo/main.dart';
import 'package:resortdemo/src/app/home/widgets/primary_button.dart';
import 'package:resortdemo/src/app/login/login_controller.dart';
import 'package:resortdemo/src/app/login/widgets/input_text_field.dart';

Widget login(
    LoginController controller, Size size, BuildContext context, bool isLogin) {
  return Stack(
    children: [
      Positioned(
          top: 0,
          left: 0,
          child: Image.asset("assets/images/login_background.jpg")),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enjoy A Longer \nAnd Healthy Life",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                isLogin ? 'Login' : 'SignUp',
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Enroll to an healthier lifestyle ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              primaryButton(
                  Colors.white,
                  Colors.black87,
                  () {},
                  isLogin ? 'Sign in with Google' : 'Sign up with Google',
                  Colors.white,
                  size,
                  icon: 'assets/icons/google.png'),
              const SizedBox(
                height: 10,
              ),
              const Divider(color: Colors.white, thickness: 1),
              const SizedBox(
                height: 10,
              ),
              inputStack(controller, size, context, 'Mail'),
              inputStack(controller, size, context, 'Password'),
              const SizedBox(
                height: 20,
              ),
              primaryButton(
                  Colors.transparent,
                  Colors.white,
                  isLogin
                      ? () {
                          controller.chekIfUserOnFirestore(controller.email);
                        }
                      : () {
                          controller.registerUser(
                              controller.email!,
                              controller.password!,
                              "Saido Perfecto",
                              "Yücekaya");
                        },
                  isLogin ? 'Login' : 'Register',
                  Colors.white,
                  size),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: (() {
                  print('helloö');
                }),
                child: TextButton(
                    onPressed: isLogin
                        ? () {
                            controller.pageController.animateToPage(1,
                                duration: const Duration(microseconds: 300),
                                curve: Curves.linear);
                          }
                        : () {
                            controller.pageController.animateToPage(0,
                                duration: const Duration(microseconds: 300),
                                curve: Curves.linear);
                          },
                    child: Text(
                      isLogin
                          ? 'Not registered yet? Create an account'
                          : 'Have an account? Log in',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget inputStack(
    LoginController controller, Size size, BuildContext context, String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        '$label*',
        style: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      const SizedBox(
        height: 10,
      ),
      inputTextField(controller, size, context, label),
    ],
  );
}
