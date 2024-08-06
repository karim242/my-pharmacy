import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/home/data/models/chat_model.dart';
import 'package:intl/intl.dart';

class ChattingView extends StatelessWidget {
  const ChattingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Padding(
        padding:  EdgeInsets.only(right: 38.0,left: 38.0,top: 70.0.h),
        child: const SingleChildScrollView(
          child:  Column(
        children: [
          TitleText(title: AppStrings.kConversations,),
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
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(chat.avatarUrl),
          ),
          title: Text(chat.name),
          subtitle: Text(chat.lastMessage),
          trailing: Text(DateFormat('hh:mm a').format(chat.time)),
          onTap: () {}
          
            
        );
      },
    );
  }
}