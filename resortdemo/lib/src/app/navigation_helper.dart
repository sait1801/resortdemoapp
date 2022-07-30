import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:resortdemo/src/app/login/login_view.dart';
import 'package:resortdemo/src/app/splash/splash_view.dart';
import 'package:resortdemo/src/app/forum/forum_view.dart';

import 'home/home_view.dart';

class NavigationHelper {
  static const Curve _TRANSITION_CURVE = Curves.easeInOutCubic;
  static const Duration _TRANSITION_DURATION = Duration(milliseconds: 200);

  static void navigateToLoginView(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        child: LoginView(),
        type: PageTransitionType.fade,
        curve: _TRANSITION_CURVE,
        duration: _TRANSITION_DURATION,
      ),
      (_) => false,
    );
  }

  static void navigateToSplashScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        child: SplashView(),
        type: PageTransitionType.fade,
        curve: _TRANSITION_CURVE,
        duration: _TRANSITION_DURATION,
      ),
      (_) => false,
    );
  }

  static void navigateToHomeScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        child: HomeView(),
        type: PageTransitionType.fade,
        curve: _TRANSITION_CURVE,
        duration: _TRANSITION_DURATION,
      ),
      (_) => false,
    );
  }

  // static void navigateToProfileScreen(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     PageTransition(
  //       child: UserProfileView(),
  //       type: PageTransitionType.fade,
  //       curve: _TRANSITION_CURVE,
  //       duration: _TRANSITION_DURATION,
  //     ),
  //   );
  // }

  static void navigateToForumView(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        child: ForumView(),
        type: PageTransitionType.fade,
        curve: _TRANSITION_CURVE,
        duration: _TRANSITION_DURATION,
      ),
      (_) => false,
    );
  }
}
