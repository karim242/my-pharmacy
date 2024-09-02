import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pharmacy/dependencies.dart';
import 'package:my_pharmacy/features/auth/data/models/user_model.dart';
import 'package:my_pharmacy/features/chat/data/models/chat_model.dart';
import 'package:my_pharmacy/features/chat/data/models/message_model.dart';
import 'package:my_pharmacy/features/chat/data/repo/chat_repo.dart';
import 'package:my_pharmacy/features/pharmacises/data/model/pharmacy_model.dart';

class ChatRepositoryImplementation implements ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createChat(ChatModel chat) async {
    await _firestore.collection('chats').doc(chat.id).set(chat.toJson());
  }

  @override
  Future<List<ChatModel>> getChats() async {
    QuerySnapshot snapshot = await _firestore.collection('chats').get();
    return snapshot.docs.map((doc) => ChatModel.fromDocument(doc)).toList();
  }

  @override
  Future<List<MessageModel>> getMessages(String chatId) async {
    QuerySnapshot snapshot = await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp')
        .get();

    return snapshot.docs
        .map((doc) =>
            MessageModel.fromDocument(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> sendMessage(String chatId, MessageModel message) async {
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toJson());

    await _firestore.collection('chats').doc(chatId).update({
      'lastMessage': message.content,
      'timestamp': message.timestamp,
    });
  }

  @override
  Future<void> updateChat(ChatModel chat) async {
    await _firestore.collection('chats').doc(chat.id).update(chat.toJson());
  }

  @override
  Future<void> deleteChat(String chatId) async {
    await _firestore.collection('chats').doc(chatId).delete();
  }

  @override
  Future<List<PharmacyModel>> getAllPharmacise() async {
    try {
      final snapshot = await _firestore.collection('pharmacies').get();
      return snapshot.docs
          .map((doc) => PharmacyModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get users: $e');
    }
  }
}
