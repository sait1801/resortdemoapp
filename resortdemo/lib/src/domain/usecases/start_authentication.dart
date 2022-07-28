import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/domain/repositories/authentication_repository.dart';

class StartAuthentication extends UseCase<void, StartAuthenticationParams> {
  final AuthenticationRepository _authenticationRepository;

  StartAuthentication(this._authenticationRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(
      StartAuthenticationParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _authenticationRepository.startAuthentication(
        params!.email,
        params!.password,
      );
      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      controller.addError(error);
    }
    return controller.stream;
  }
}

class StartAuthenticationParams {
  final String email;
  final String password;
  StartAuthenticationParams(this.email, this.password);
}
