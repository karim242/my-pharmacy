import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pharmacy/features/chat/data/models/message_model.dart';

class ChatModel {
  final String id;
  final String name;
  final String lastMessage;
  final Timestamp timestamp;
  final String? avatarUrl;
  final List<MessageModel> messages; // إضافة قائمة الرسائل

  ChatModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.timestamp,
    this.avatarUrl,
    required this.messages, // الحقل الجديد
  });

  factory ChatModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ChatModel(
      id: doc.id,
      name: data['name'] as String,
      lastMessage: data['lastMessage'] as String,
      timestamp: data['timestamp'] as Timestamp,
      avatarUrl: data['avatarUrl'] as String?,
      messages: (data['messages'] as List<dynamic>)
          .map((messageData) =>
              MessageModel.fromDocument(messageData as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastMessage': lastMessage,
      'timestamp': timestamp,
      'avatarUrl': avatarUrl,
      'messages': messages.map((message) => message.toJson()).toList(),
    };
  }

  ChatModel copyWith({
    String? id,
    String? name,
    String? lastMessage,
    Timestamp? timestamp,
    String? avatarUrl,
    List<MessageModel>? messages,
  }) {
    return ChatModel(
      id: id ?? this.id,
      name: name ?? this.name,
      lastMessage: lastMessage ?? this.lastMessage,
      timestamp: timestamp ?? this.timestamp,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      messages: messages ?? this.messages,
    );
  }
}
