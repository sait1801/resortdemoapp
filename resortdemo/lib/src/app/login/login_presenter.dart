import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../domain/repositories/authentication_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/check_if_user_on_firestore.dart';
import '../../domain/usecases/start_authentication.dart';

class LoginPresenter extends Presenter {
  late Function checkIfUserOnFirestoreOnNext;
  late Function checkIfUserOnFirestoreOnError;

  late Function startAuthenticationOnComplete;
  late Function startAuthenticationOnError;

  late Function verifySmsCodeOnNext;
  late Function verifySmsCodeOnError;

  final CheckIfUserOnFirestore _checkIfUserOnFirestore;
  final StartAuthentication _startAuthentication;

  LoginPresenter(UserRepository userRepository,
      AuthenticationRepository authenticationRepository)
      : _checkIfUserOnFirestore = CheckIfUserOnFirestore(userRepository),
        _startAuthentication = StartAuthentication(authenticationRepository);

  @override
  void dispose() {
    _checkIfUserOnFirestore.dispose();
    _startAuthentication.dispose();
  }

  checkIfUserOnFirestore(String email) {
    _checkIfUserOnFirestore.execute(_CheckIfUserOnFirestoreObserver(this),
        CheckIfUserOnFirebaseParams(email));
  }

  startAuthentication(String email, String password) {
    _startAuthentication.execute(_StartAuthenticationObserver(this),
        StartAuthenticationParams(email, password));
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
