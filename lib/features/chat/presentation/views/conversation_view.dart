import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_state.dart';
import 'package:my_pharmacy/features/chat/presentation/widgets/conversation_item.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Removes the back button
        title: const TitleText(
          title: AppStrings.kConversations,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          right: 38.0,
          left: 38.0,
        ),
        child: ConversationsList(),
      ),
    );
  }
}

class ConversationsList extends StatelessWidget {
  const ConversationsList({super.key});

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
              return ConversationItem(chat: chat); // استخدام الـ Widget الموجود
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
