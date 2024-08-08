import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/home/data/models/chat_model.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/conversation_item.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 38.0, left: 38.0, top: 70.0.h),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              TitleText(
                title: AppStrings.kConversations,
              ),
              ConversationsList(),
            ],
          ),
        ),
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
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ConversationItem(chat: chats[index]);
      },
    );
  }
}
