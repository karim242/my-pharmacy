import 'package:my_pharmacy/features/auth/data/models/user_model.dart';
import 'package:my_pharmacy/features/chat/data/models/chat_model.dart';
import 'package:my_pharmacy/features/chat/data/models/message_model.dart';
import 'package:my_pharmacy/features/pharmacises/data/model/pharmacy_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatModel> chats;

  ChatLoaded(this.chats);
}

class ChatEmpty extends ChatState {}

class MessagesLoaded extends ChatState {
  final List<MessageModel> messages;

  MessagesLoaded(this.messages);
}

class ChatError extends ChatState {
  final String message;

  ChatError(this.message);
}

class PharmacyLoading extends ChatState {}

class PharmacyLoaded extends ChatState {
  final List<PharmacyModel> pharmacies;

  PharmacyLoaded(this.pharmacies);
}

class UsersError extends ChatState {
  final String message;

  UsersError(this.message);
}
