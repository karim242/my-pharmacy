import 'package:my_pharmacy/features/chat/data/models/chat_model.dart';
import 'package:my_pharmacy/features/chat/data/models/message_model.dart';

abstract class ChatRepository {
  Future<List<ChatModel>> fetchChats(String userId);
  Future<void> updateLastMessage(
      String chatId, MessageModel message, bool isSent);
  Future<void> createChat(ChatModel chat);
  Stream<void> loadMessage(
    String chatId,
  );
}
