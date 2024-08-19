import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String content;
  final bool isSent;
  final Timestamp timestamp;

  MessageModel({
    required this.senderId,
    required this.content,
    required this.timestamp,
    required this.isSent,
  });

  factory MessageModel.fromDocument(Map<String, dynamic> data) {
    return MessageModel(
      senderId: data['senderId'] as String,
      content: data['content'] as String,
      timestamp: data['timestamp'] as Timestamp,
      isSent: data['isSent'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'content': content,
      'isSent': isSent,
      'timestamp': timestamp,
    };
  }
}
