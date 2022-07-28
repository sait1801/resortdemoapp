import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../repositories/user_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class InitializeApp extends UseCase<void, void> {
  final UserRepository _userRepository;

  InitializeApp(this._userRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(void params) async {
    StreamController<void> controller = StreamController();
    try {
      await _userRepository.initalizeUserRepository();

      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      controller.addError(error);
    }
    return controller.stream;
  }
}
