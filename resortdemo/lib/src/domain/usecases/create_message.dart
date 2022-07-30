import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/domain/entities/message.dart';
import 'package:resortdemo/src/domain/repositories/message_repository.dart';

class CreateMessage extends UseCase<void, CreateMessageParams> {
  final MessageRepository _MessageRepository;

  CreateMessage(this._MessageRepository);

  late StreamController<void> _controller;

  @override
  Future<Stream<void>> buildUseCaseStream(CreateMessageParams? params) async {
    _controller = StreamController();

    try {
      await _MessageRepository.createMessage(params!.message);
      _controller.close();
    } catch (e) {
      print(e);
      _controller.addError(e);
    }

    return _controller.stream;
  }
}

class CreateMessageParams {
  final Message message;
  CreateMessageParams(this.message);
}
