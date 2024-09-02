import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pharmacy/features/chat/data/models/chat_model.dart';
import 'package:my_pharmacy/features/chat/data/models/message_model.dart';
import 'package:my_pharmacy/features/chat/data/repo/chat_repo.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatRepository;

  ChatCubit(this.chatRepository) : super(ChatInitial());

  Future<void> fetchChats() async {
    emit(ChatLoading());
    try {
      final chats = await chatRepository.getChats();
      emit(ChatLoaded(chats));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> fetchMessages(String chatId) async {
    emit(ChatLoading());
    try {
      final messages = await chatRepository.getMessages(chatId);
      emit(MessagesLoaded(messages));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> sendMessage(String chatId, String messageContent,
      String senderId, bool isSent) async {
    final message = MessageModel(
      senderId: senderId,
      content: messageContent,
      timestamp: Timestamp.now(),
      isSent: isSent,
    );

    emit(ChatLoading());
    try {
      await chatRepository.sendMessage(chatId, message);
      await fetchMessages(chatId);
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> createChat(ChatModel chat) async {
    emit(ChatLoading());
    try {
      await chatRepository.createChat(chat);
      await fetchChats();
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> updateChat(ChatModel chat) async {
    emit(ChatLoading());
    try {
      await chatRepository.updateChat(chat);
      await fetchChats();
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> deleteChat(String chatId) async {
    emit(ChatLoading());
    try {
      await chatRepository.deleteChat(chatId);
      await fetchChats();
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> fetchAllPharmacies() async {
    emit(PharmacyLoading());
    try {
      final pharmacy = await chatRepository.getAllPharmacise();
      emit(PharmacyLoaded(pharmacy));
    } catch (e) {
      emit(UsersError('Failed to fetch users: $e'));
    }
  }
}
