import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../repositories/user_repository.dart';

class CheckIfUserOnFirestore
    extends UseCase<bool, CheckIfUserOnFirebaseParams> {
  final UserRepository _userRepository;

  CheckIfUserOnFirestore(this._userRepository);

  @override
  Future<Stream<bool>> buildUseCaseStream(
      CheckIfUserOnFirebaseParams? params) async {
    StreamController<bool> controller = StreamController();
    try {
      bool isUserOnFirestore =
          await _userRepository.checkIfUserOnFirestore(params!.email);
      controller.add(isUserOnFirestore);
      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      controller.addError(error);
    }
    return controller.stream;
  }
}

class CheckIfUserOnFirebaseParams {
  final String email;
  CheckIfUserOnFirebaseParams(this.email);
}
