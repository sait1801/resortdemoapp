import 'package:resortdemo/src/domain/entities/message.dart';
import 'package:resortdemo/src/domain/repositories/message_repository.dart';
import 'package:resortdemo/src/domain/usecases/create_message.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ForumPresenter extends Presenter {
  late Function createMessageOnComplete;
  late Function createMessageOnError;

  final CreateMessage _createMessage;

  ForumPresenter(MessageRepository _messageRepository)
      : _createMessage = CreateMessage(_messageRepository);

  @override
  void dispose() {
    _createMessage.dispose();
  }

  void createMessage(Message message) {
    _createMessage.execute(
        _CreateMessagesObserver(this), CreateMessageParams(message));
  }
}

class _CreateMessagesObserver extends Observer<List<Message>> {
  final ForumPresenter _presenter;

  _CreateMessagesObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.createMessageOnComplete();
  }

  @override
  void onError(e) {
    _presenter.createMessageOnError(e);
  }

  @override
  void onNext(void response) {}
}
