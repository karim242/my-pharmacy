import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_state.dart';
import 'package:my_pharmacy/features/chat/presentation/widgets/conversation_item.dart';

class AllChatsList extends StatelessWidget {
  const AllChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is ChatLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChatLoaded) {
          return ListView.builder(
            itemCount: state.chats.length,
            itemBuilder: (context, index) {
              final chat = state.chats[index];
              return ConversationItem(chat: chat);
            },
          );
        } else if (state is ChatEmpty) {
          return const Center(child: Text('No chats found.'));
        } else if (state is ChatError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Container();
      },
    );
  }
}
