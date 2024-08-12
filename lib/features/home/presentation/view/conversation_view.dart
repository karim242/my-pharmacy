import 'package:flutter/material.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/home/data/models/chat_static_model.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/conversation_item.dart';

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
  const ConversationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ConversationItem(chat: chats[index]);
      },
    );
  }
}
