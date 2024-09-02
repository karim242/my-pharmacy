import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/chat/data/models/chat_model.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_state.dart';
import 'package:my_pharmacy/features/chat/presentation/widgets/active_chat_box.dart';
import 'package:my_pharmacy/features/chat/presentation/widgets/inactive_chat_box.dart';

class ConversationView extends StatelessWidget {
  final ChatModel chat;

  const ConversationView({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          chat.name,
          style: TextStyles.textStyle20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  if (state is ChatLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MessagesLoaded) {
                    return ListView.builder(
                      reverse: true,
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final message = state.messages[index];

                        return message.isSent
                            ? ActiveChattingBox(message: message.content)
                            : InActiveChattingBox(message: message.content);
                      },
                    );
                  } else if (state is ChatError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'اكتب رسالتك',
                        filled: true,
                        suffixIcon: const Icon(
                          Icons.image,
                          size: 24,
                          color: AppColors.primaryColor,
                        ),
                        contentPadding: const EdgeInsets.all(4),
                        fillColor: AppColors.lightGrayColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: IconButton(
                        icon: const Icon(
                          Icons.send,
                          size: 16,
                          color: AppColors.whiteColor,
                        ),
                        onPressed: () {
                          final messageContent = controller.text;
                          if (messageContent.isNotEmpty) {
                            final currentUser =
                                FirebaseAuth.instance.currentUser;
                            final currentUserId = currentUser?.uid;
                            if (currentUserId != null) {
                              final isSent = currentUserId == chat.id;
                              context.read<ChatCubit>().sendMessage(
                                    chat.id,
                                    messageContent,
                                    currentUserId,
                                    isSent,
                                  );
                              controller.clear();
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
