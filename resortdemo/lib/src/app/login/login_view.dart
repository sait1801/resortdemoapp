import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/home/constants_home.dart';
import 'package:resortdemo/src/app/login/login_controller.dart';

import '../../data/data_authentication_repository.dart';
import '../../data/data_user_repository.dart';

class LoginView extends View {
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _LoginViewState(
        LoginController(
          DataUserRepository(),
          DataAuthenticationRepository(),
        ),
      );
}

class _LoginViewState extends ViewState<LoginView, LoginController> {
  _LoginViewState(LoginController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: ControlledWidgetBuilder<LoginController>(
          builder: (context, controller) {
        return PageView(
          key: globalKey,
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset("assets/images/login_background.jpg"))
              ],
            )
          ],
        );
      }),
    );
  }
}
