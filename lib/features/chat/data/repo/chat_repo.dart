import 'package:my_pharmacy/features/auth/data/models/user_model.dart';
import 'package:my_pharmacy/features/chat/data/models/chat_model.dart';
import 'package:my_pharmacy/features/chat/data/models/message_model.dart';
import 'package:my_pharmacy/features/pharmacises/data/model/pharmacy_model.dart';

abstract class ChatRepository {
  Future<void> createChat(ChatModel chat);
  Future<List<ChatModel>> getChats();
  Future<List<MessageModel>> getMessages(String chatId);
  Future<void> sendMessage(String chatId, MessageModel message);
  Future<void> updateChat(ChatModel chat);
  Future<void> deleteChat(String chatId);
  Future<List<PharmacyModel>> getAllPharmacise();
}
