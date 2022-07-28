import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/initialize_app.dart';
import '../../domain/usecases/is_user_logged_in.dart';

class SplashPresenter extends Presenter {
  late Function isUserLoggedInOnNext;
  late Function isUserLoggedInOnError;

  late Function initializeAppOnComplete;
  late Function initializeAppOnError;

  final IsUserLoggedIn _isUserLoggedIn;
  final InitializeApp _initializeApp;

  SplashPresenter(
    UserRepository userRepository,
  )   : _isUserLoggedIn = IsUserLoggedIn(userRepository),
        _initializeApp = InitializeApp(
          userRepository,
        );

  @override
  void dispose() {
    _isUserLoggedIn.dispose();
    _initializeApp.dispose();
  }

  void isUserLoggedIn() {
    _isUserLoggedIn.execute(_IsUserLoggedInObserver(this));
  }

  void initializeApp() {
    _initializeApp.execute(_InitializeAppObserver(this));
  }
}

class _IsUserLoggedInObserver extends Observer<bool> {
  final SplashPresenter _presenter;

  _IsUserLoggedInObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.isUserLoggedInOnError(e);
  }

  @override
  void onNext(bool? isUserLoggedIn) {
    _presenter.isUserLoggedInOnNext(isUserLoggedIn);
  }
}

class _InitializeAppObserver extends Observer<void> {
  final SplashPresenter _presenter;

  _InitializeAppObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.initializeAppOnComplete();
  }

  @override
  void onError(e) {
    _presenter.initializeAppOnError(e);
  }

  @override
  void onNext(void response) {}
}
