class Message {
  final String id;
  final String fullName;
  final String contactNumber;
  final String forumMessage;

  Message(
    this.id,
    this.fullName,
    this.contactNumber,
    this.forumMessage,
  );

  Message.fromMap(Map<String, dynamic> data, String id)
      : id = id,
        fullName = data['fullName'],
        contactNumber = data['contactNumber'],
        forumMessage = data['forumMessage'];

  Message.fromMessage(Message message)
      : id = message.id,
        fullName = message.fullName,
        contactNumber = message.contactNumber,
        forumMessage = message.forumMessage;

  @override
  String toString() => '$id, $fullName, $contactNumber, $forumMessage';
}
