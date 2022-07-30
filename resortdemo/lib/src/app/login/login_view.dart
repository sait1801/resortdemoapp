import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/home/constants_home.dart';
import 'package:resortdemo/src/app/login/login_controller.dart';
import 'package:resortdemo/src/app/login/widgets/login.dart';
import 'package:resortdemo/src/app/login/widgets/sign_up.dart';

import '../../data/data_authentication_repository.dart';
import '../../data/data_user_repository.dart';

class LoginView extends View {
  static const routeName = '/login';
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
    return SafeArea(
      child: ControlledWidgetBuilder<LoginController>(
          builder: (context, controller) {
        return Scaffold(
          body: PageView(
              key: globalKey,
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: [
                login(controller, size, context, true),
                signUp(controller, size, context),
              ]),
        );
      }),
    );
  }
}
