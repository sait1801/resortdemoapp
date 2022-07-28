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

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed();
  }

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.checkIfUserOnFirestoreOnNext = (bool isUserOnFirestore) {
      if (isUserOnFirestore) {
        _presenter.startAuthentication(email!, password!);
      } else {
        DataAuthenticationRepository().startRegistration(email!,
            password!); //todo: this will be fixed and became a usecase may be if not registered then become a memberpopup with quick info taking!!
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
}
