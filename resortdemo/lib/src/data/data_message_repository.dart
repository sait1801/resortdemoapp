import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resortdemo/src/data/data_authentication_repository.dart';
import 'package:resortdemo/src/data/data_user_repository.dart';
import 'package:resortdemo/src/domain/entities/message.dart';
import 'package:resortdemo/src/domain/repositories/message_repository.dart';

class DataMessageRepository implements MessageRepository {
  static final _instance = DataMessageRepository._internal();
  DataMessageRepository._internal();
  factory DataMessageRepository() => _instance;

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference userReferance =
      FirebaseFirestore.instance.collection("user");

  CollectionReference messagesReference =
      FirebaseFirestore.instance.collection("messages");

  String? userId;
  List<Message> messages = [];

  @override
  Future<void> createMessage(Message message) async {
    try {
      message.id = userReferance.id;
      print('message: ${message.fullName}');
      await messagesReference.add(message.toMap(message));
      messages.add(message);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
