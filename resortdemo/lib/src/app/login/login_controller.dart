import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/navigation_helper.dart';
import 'package:resortdemo/src/data/data_authentication_repository.dart';

import '../../domain/repositories/authentication_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../splash/widgets/primary_popup.dart';
import 'login_presenter.dart';

class LoginController extends Controller {
  final LoginPresenter _presenter;

  LoginController(UserRepository userRepository,
      AuthenticationRepository authenticationRepository)
      : _presenter = LoginPresenter(userRepository, authenticationRepository);

  String? email;
  String? password;
  String? name;
  String? lastName;

  late PageController pageController;
  late TextEditingController mailTextController;
  late TextEditingController passwordTextController;

  @override
  void onDisposed() {
    pageController.dispose();
    _presenter.dispose();
    super.onDisposed();
  }

  @override
  void onInitState() {
    pageController = PageController(initialPage: 0);
    mailTextController = TextEditingController();
    passwordTextController = TextEditingController();

    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.checkIfUserOnFirestoreOnNext = (bool isUserOnFirestore) {
      if (isUserOnFirestore) {
        _presenter.startAuthentication(email!, password!);
      } else {
        FocusScope.of(getContext()).unfocus();
        pageController.animateToPage(1,
            duration: const Duration(milliseconds: 350), curve: Curves.linear);
      }
      FocusScope.of(getContext()).unfocus();
    };

    _presenter.checkIfUserOnFirestoreOnError = (e) {
      PrimaryPopup(
        context: getContext(),
        title: 'Sorry',
        content: 'Something Went Wrong, Please Try Again.',
      ).showDefaultPopup();
    };

    _presenter.registerUserOnComplete = () {
      //is this true ?
      _presenter.startAuthentication(email!, password!);
    };

    _presenter.registerUserOnError = (e) {
      PrimaryPopup(
        context: getContext(),
        title: 'Sorry',
        content:
            'Sorry, we can\'t find an account with this email address. Please try again',
      ).showDefaultPopup();
    };

    _presenter.startAuthenticationOnComplete = () {
      FocusScope.of(getContext()).unfocus();
      NavigationHelper.navigateToHomeScreen(getContext());
    };

    _presenter.startAuthenticationOnError = (e) {
      PrimaryPopup(
        context: getContext(),
        title: 'Sorry',
        content: 'Something Went Wrong Please Try Again',
      ).showDefaultPopup();
    };
  }

  void chekIfUserOnFirestore(String? email) {
    if (email != null) _presenter.checkIfUserOnFirestore(email);
  }

  void registerUser(
      String email, String password, String name, String lastName) {
    _presenter.registerUser(email, password, name, lastName);
  }
}
