import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pharmacy/features/chat/data/models/chat_model.dart';
import 'package:my_pharmacy/features/chat/data/models/message_model.dart';
import 'package:my_pharmacy/features/chat/data/repo/chat_repo.dart';

class ChatRepositoryImpl implements ChatRepository {
  final FirebaseFirestore firestore;

  ChatRepositoryImpl(
    this.firestore,
  );

  @override
  Future<List<ChatModel>> fetchChats(String userId) async {
    try {
      final querySnapshot = await firestore
          .collection('chats')
          //.where('participants', arrayContains: userId)
          //.orderBy('timestamp', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => ChatModel.fromDocument(doc))
          .toList();
    } catch (e) {
      throw Exception('Failed to load chats: $e');
    }
  }

  @override
  Future<void> updateLastMessage(
      String chatId, MessageModel message, bool isSent) async {
    try {
      final chatRef = firestore.collection('chats').doc(chatId);

      await chatRef.update({
        'lastMessage': message.content,
        'timestamp': message.timestamp,
        'messages': FieldValue.arrayUnion([message.toJson()]),
        'isSent': isSent
      });
    } catch (e) {
      throw Exception('Failed to update chat: $e');
    }
  }

  @override
  Future<void> createChat(ChatModel chat) async {
    try {
      await firestore.collection('chats').doc(chat.id).set(chat.toJson());
    } catch (e) {
      throw Exception('Failed to create chat: $e');
    }
  }

  @override
  Stream<List<MessageModel>> loadMessage(String chatId) {
    try {
      final chatRef = firestore.collection('chats').doc(chatId);

      return chatRef.snapshots().map((snapshot) {
        final data = snapshot.data();
        if (data != null && data['messages'] != null) {
          return (data['messages'] as List)
              .map((message) => MessageModel.fromDocument(message))
              .toList();
        } else {
          return [];
        }
      });
    } catch (e) {
      throw Exception('Failed to load messages: $e');
    }
  }
}
