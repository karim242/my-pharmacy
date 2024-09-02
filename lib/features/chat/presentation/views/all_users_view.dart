// lib/features/chat/presentation/screens/users_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/features/chat/data/repo/chat_repo.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:my_pharmacy/features/chat/presentation/cubit/chat_state.dart';

class AllUsersView extends StatelessWidget {
  const AllUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => context.read<ChatCubit>().fetchChats());

    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: UsersList(),
    );
  }
}

class UsersList extends StatelessWidget {
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
                title: Text(pharmacie.name),
                subtitle: Text(pharmacie.address),
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
