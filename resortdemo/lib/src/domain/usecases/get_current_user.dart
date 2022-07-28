import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class GetCurrentUser extends UseCase<User, void> {
  final UserRepository _userRepository;

  GetCurrentUser(this._userRepository);

  @override
  Future<Stream<User>> buildUseCaseStream(void params) async {
    StreamController<User> controller = StreamController();
    try {
      User user = _userRepository.currentUser;
      controller.add(user);
      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);

      controller.addError(error);
    }
    return controller.stream;
  }
}
