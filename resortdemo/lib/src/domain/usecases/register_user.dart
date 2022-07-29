import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/domain/repositories/authentication_repository.dart';

class RegisterUser extends UseCase<void, RegisterUserParams> {
  final AuthenticationRepository _authenticationRepository;

  RegisterUser(this._authenticationRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(RegisterUserParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _authenticationRepository.startRegistration(
          params!.email, params.password, params.name, params.lastName);
      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      controller.addError(error);
    }
    return controller.stream;
  }
}

class RegisterUserParams {
  final String email;
  final String password;
  final String name;
  final String lastName;

  RegisterUserParams(this.email, this.password, this.name, this.lastName);
}
