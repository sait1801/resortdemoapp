import '../entities/message.dart';

abstract class MessageRepository {
  Future<void> createMessage(Message message);
}
