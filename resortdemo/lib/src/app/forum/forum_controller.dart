import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/forum/forum_presenter.dart';
import 'package:resortdemo/src/app/splash/widgets/primary_popup.dart';
import 'package:resortdemo/src/data/data_authentication_repository.dart';
import 'package:resortdemo/src/data/data_user_repository.dart';
import 'package:resortdemo/src/domain/entities/message.dart';
import 'package:resortdemo/src/domain/repositories/message_repository.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';

class ForumController extends Controller {
  final ForumPresenter _presenter;

  ForumController(
    MessageRepository messageRepository,
  ) : _presenter = ForumPresenter(messageRepository);

  late String contactNumber;
  late String name;
  late String forumMessage;

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed();
  }

  @override
  void initListeners() {
    _presenter.createMessageOnComplete = () {
      print("Message is created");
      refreshUI();
    };

    _presenter.createMessageOnError = () {
      print("BURAYA PRIMARY POP UP YAZ");
    };
  }

  void createMessage() {
    if (name.isEmpty || contactNumber.isEmpty || forumMessage.isEmpty) {
      PrimaryPopup(
        context: getContext(),
        title: 'Sorry',
        content: 'Please fill All of the necessary fields.',
      ).showDefaultPopup();
    }
    _presenter.createMessage(Message('', name, contactNumber, forumMessage));
  }

  void refreshScreeen() {
    refreshUI();
  }
}
