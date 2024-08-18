import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/features/chat/data/models/message_model.dart';
import 'package:my_pharmacy/features/chat/data/repo/chat_repo.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_state.dart';
class ChatCubit extends Cubit<ChatState> {
  final ChatRepository repository;

  ChatCubit(this.repository) : super(ChatInitial());

  Future<void> loadChats(String userId) async {
    try {
      emit(ChatLoading());
      final chats = await repository.fetchChats(userId);
      if (chats.isEmpty) {
        emit(ChatEmpty());
      } else {
        emit(ChatLoaded(chats));
      }
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> sendMessage(String chatId, String message, String senderId) async {
    try {
      final timestamp = Timestamp.now();
      final newMessage = MessageModel(
        senderId: senderId,
        content: message,
        timestamp: timestamp,
      );

      await repository.updateLastMessage(chatId, newMessage);

      if (state is ChatLoaded) {
        final updatedChats = (state as ChatLoaded).chats.map((chat) {
          if (chat.id == chatId) {
            final updatedMessages = List<MessageModel>.from(chat.messages)..add(newMessage);
            return chat.copyWith(lastMessage: message, timestamp: timestamp, messages: updatedMessages);
          }
          return chat;
        }).toList();
        emit(ChatLoaded(updatedChats));
      }
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}