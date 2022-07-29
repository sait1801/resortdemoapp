import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/domain/usecases/register_user.dart' as regUser;

import '../../domain/repositories/authentication_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/check_if_user_on_firestore.dart';
import '../../domain/usecases/start_authentication.dart';

class LoginPresenter extends Presenter {
  late Function checkIfUserOnFirestoreOnNext;
  late Function checkIfUserOnFirestoreOnError;

  late Function startAuthenticationOnComplete;
  late Function startAuthenticationOnError;

  late Function registerUserOnComplete;
  late Function registerUserOnError;

  final CheckIfUserOnFirestore _checkIfUserOnFirestore;
  final StartAuthentication _startAuthentication;
  final regUser.RegisterUser _registerUser;

  LoginPresenter(UserRepository userRepository,
      AuthenticationRepository authenticationRepository)
      : _checkIfUserOnFirestore = CheckIfUserOnFirestore(userRepository),
        _startAuthentication = StartAuthentication(authenticationRepository),
        _registerUser = regUser.RegisterUser(authenticationRepository);

  @override
  void dispose() {
    _checkIfUserOnFirestore.dispose();
    _startAuthentication.dispose();
    _registerUser.dispose();
  }

  checkIfUserOnFirestore(String email) {
    _checkIfUserOnFirestore.execute(_CheckIfUserOnFirestoreObserver(this),
        CheckIfUserOnFirebaseParams(email));
  }

  startAuthentication(String email, String password) {
    _startAuthentication.execute(_StartAuthenticationObserver(this),
        StartAuthenticationParams(email, password));
  }

  registerUser(String email, String password, String name, String lastName) {
    _registerUser.execute(RegisterUserObserver(this),
        regUser.RegisterUserParams(email, password, name, lastName));
  }
}

class _CheckIfUserOnFirestoreObserver extends Observer<bool> {
  final LoginPresenter _presenter;

  _CheckIfUserOnFirestoreObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.checkIfUserOnFirestoreOnError(e);
  }

  @override
  void onNext(bool? isUserOnFirestore) {
    _presenter.checkIfUserOnFirestoreOnNext(isUserOnFirestore);
  }
}

class _StartAuthenticationObserver extends Observer<void> {
  final LoginPresenter _presenter;

  _StartAuthenticationObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.startAuthenticationOnComplete();
  }

  @override
  void onError(e) {
    _presenter.startAuthenticationOnError(e);
  }

  @override
  void onNext(_) {}
}

class RegisterUserObserver extends Observer<void> {
  final LoginPresenter _presenter;

  RegisterUserObserver(this._presenter);
  @override
  void onComplete() {
    _presenter.registerUserOnComplete();
  }

  @override
  void onError(e) {
    _presenter.registerUserOnError(e);
  }

  @override
  void onNext(void response) {}
}
