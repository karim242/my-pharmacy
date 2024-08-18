import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/chat/data/models/chat_model.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem({
    super.key,
    required this.chat,
  });

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        leading: CircleAvatar(
          radius: 22.0,
          backgroundImage: AssetImage(chat.avatarUrl??''),
        ),
        title: Text(
          chat.name,
          style: TextStyles.textStyle12.copyWith(color: AppColors.blackColor),
        ),
        subtitle: Text(
          chat.lastMessage,
          style: TextStyles.textStyle10.copyWith(color: AppColors.grayColor),
        ),
        trailing: Text(chat.timestamp.toDate().toString()),
        onTap: () {
          GoRouter.of(context).push(RoutesNames.kChattingView,extra: chat);
        });
  }
}
