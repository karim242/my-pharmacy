import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/chat/data/models/chat_model.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_cubit.dart';

class ChattingView extends StatelessWidget {
  final ChatModel chat;

  const ChattingView({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          chat.name, // اسم المستخدم الآخر في المحادثة
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
              child: ListView.builder(
                reverse: true,
                itemCount: chat.messages.length,
                itemBuilder: (context, index) {
                  final message = chat.messages[index];
                  return ListTile(
                    title: Text(message.content),
                    subtitle: Text(message.timestamp.toDate().toString()),
                  );
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
                          final message = controller.text;
                          if (message.isNotEmpty) {
                            context
                                .read<ChatCubit>()
                                .sendMessage(chat.id, message, 'sender_id');
                            controller.clear();
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
