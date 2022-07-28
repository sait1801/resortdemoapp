import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/navigation_helper.dart';
import 'package:resortdemo/src/app/splash/splash_presenter.dart';
import 'package:resortdemo/src/app/splash/widgets/primary_popup.dart';

import '../../data/exceptions/user_deleted_from_authentication_exception.dart';
import '../../data/exceptions/user_disabled_from_authentication_exception.dart';
import '../../domain/repositories/user_repository.dart';

class SplashController extends Controller {
  final SplashPresenter _presenter;

  SplashController(
    UserRepository userRepository,
  ) : _presenter = SplashPresenter(
          userRepository,
        );
  double animatedOpacityValue = 0.0;

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed();
  }

  @override
  void onInitState() async {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      animatedOpacityValue = 1.0;
      refreshUI();
    });
    await Future.delayed(const Duration(milliseconds: 3500));
    _presenter.isUserLoggedIn();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.isUserLoggedInOnNext = (bool isUserLoggedIn) {
      if (!isUserLoggedIn) {
        NavigationHelper.navigateToLoginView(getContext());
      } else {
        _presenter.initializeApp();
      }
    };

    _presenter.isUserLoggedInOnError = (e) {
      if (e is UserDeletedFromAuthenticationException) {
        ScaffoldMessenger.of(getContext()).showSnackBar(
          const SnackBar(
            content: Text('No info about your login'),
            duration: Duration(seconds: 2),
          ),
        );
      } else if (e is UserDisabledFromAuthenticationException) {
        ScaffoldMessenger.of(getContext()).showSnackBar(
          const SnackBar(
            content: Text('The account has suspended'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      NavigationHelper.navigateToLoginView(getContext());
      print(e);
    };

    _presenter.initializeAppOnComplete = () {
      NavigationHelper.navigateToHomeScreen(getContext());
    };

    _presenter.initializeAppOnError = (e) {
      PrimaryPopup(
        context: getContext(),
        title: 'Sorry',
        content: 'Something Went Wrong Please Try Again',
      ).showDefaultPopup();
    };
  }
}
