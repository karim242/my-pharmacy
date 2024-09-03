// lib/features/chat/presentation/screens/users_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/chat/data/repo/chat_repo.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_state.dart';

class AllUsersView extends StatelessWidget {
  const AllUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => context.read<ChatCubit>().fetchChats());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('الصيدليات'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ],
      ),
      body: const UsersList(),
    );
  }
}

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ChatCubit>().fetchAllPharmacies();

    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is PharmacyLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PharmacyLoaded) {
          final pharmacies = state.pharmacies;
          return ListView.builder(
            itemCount: pharmacies.length,
            itemBuilder: (context, index) {
              final pharmacie = pharmacies[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(pharmacie.imageUrl),
                ),
                title: Text(
                  pharmacie.name,
                  style: TextStyles.textStyle14
                      .copyWith(color: AppColors.blackColor),
                ),
                subtitle: Text(
                  pharmacie.address,
                  style: TextStyles.textStyle12
                      .copyWith(color: AppColors.grayColor),
                ),
              );
            },
          );
        } else if (state is UsersError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Container();
      },
    );
  }
}
