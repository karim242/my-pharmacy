import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:my_pharmacy/features/chat/presentation/widgets/all_chats_list.dart';

class AllChatsView extends StatelessWidget {
  const AllChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => context.read<ChatCubit>().fetchChats());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: TitleText(
          title: AppStrings.kConversations(context),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.0),
        child: AllChatsList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(RoutesNames.KallUsersView);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}
