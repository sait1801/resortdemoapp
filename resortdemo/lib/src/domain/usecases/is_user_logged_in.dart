import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../repositories/user_repository.dart';

class IsUserLoggedIn extends UseCase<bool, void> {
  final UserRepository _userRepository;

  IsUserLoggedIn(this._userRepository);

  @override
  Future<Stream<bool>> buildUseCaseStream(void params) async {
    StreamController<bool> controller = StreamController();
    try {
      bool isUserLoggedIn = await _userRepository.isUserLoggedIn;
      controller.add(isUserLoggedIn);
      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      controller.addError(error);
    }
    return controller.stream;
  }
}
