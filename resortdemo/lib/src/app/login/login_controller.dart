import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../domain/repositories/authentication_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../splash/widgets/primary_popup.dart';
import 'login_presenter.dart';

class LoginController extends Controller {
  final LoginPresenter _presenter;

  LoginController(UserRepository userRepository,
      AuthenticationRepository authenticationRepository)
      : _presenter = LoginPresenter(userRepository, authenticationRepository);

  late PageController pageController;

  String? email;
  String? password;

  @override
  void onDisposed() {
    pageController.dispose();
    _presenter.dispose();
    super.onDisposed();
  }

  @override
  void onInitState() {
    pageController = PageController(initialPage: 0);
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.checkIfUserOnFirestoreOnNext = (bool isUserOnFirestore) {
      if (isUserOnFirestore) {
        _presenter.startAuthentication(email!, password!);
      } else {
        ScaffoldMessenger.of(getContext()).showSnackBar(
            const SnackBar(content: Text('You are not registered')));
      }
      FocusScope.of(getContext()).unfocus();
    };

    _presenter.checkIfUserOnFirestoreOnError = (e) {
      PrimaryPopup(
        context: getContext(),
        title: 'Zingo Paket',
        content:
            'Bir şeyler ters gitti, internet bağlantınızı kontrol edin veya uygulamayı yeniden başlatın',
      ).showDefaultPopup();
    };

    _presenter.startAuthenticationOnComplete = () {
      FocusScope.of(getContext()).unfocus();
      pageController.animateToPage(1,
          duration: const Duration(milliseconds: 350), curve: Curves.linear);
    };

    _presenter.startAuthenticationOnError = (e) {
      PrimaryPopup(
        context: getContext(),
        title: 'Zingo Paket',
        content:
            'Bir şeyler ters gitti, internet bağlantınızı kontrol edin veya uygulamayı yeniden başlatın',
      ).showDefaultPopup();
    };
  }

  void chekIfUserOnFirestore(String? phoneNumber) {
    if (phoneNumber != null) _presenter.checkIfUserOnFirestore(email!);
  }
}
