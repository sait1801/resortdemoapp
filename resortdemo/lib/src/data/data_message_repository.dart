import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resortdemo/src/domain/entities/message.dart';
import 'package:resortdemo/src/domain/repositories/message_repository.dart';

class DataMessageRepository implements MessageRepository {
  static final _instance = DataMessageRepository._internal();
  DataMessageRepository._internal();
  factory DataMessageRepository() => _instance;

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference userReferance =
      FirebaseFirestore.instance.collection("user");

  CollectionReference reservationReference =
      FirebaseFirestore.instance.collection("reservations");

  String? userId;
  List<Message> messages = [];

  @override
  Future<void> createMessage(Message message) async {
    try {
      messages.add(message);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
