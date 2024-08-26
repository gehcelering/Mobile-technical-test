import 'package:flutter/material.dart';

import '../../../../core/helpers/base_screen_stateless.dart';
import '../../../../main.dart';
import '../../../users/application/cubit/user_cubit.dart';

class UsersPage extends BaseScreen<UserState, UserCubit> {
  const UsersPage({super.key});

  @override
  UserCubit createBloc() => getIt<UserCubit>()..loadUsers();

  @override
  Widget buildScreen(BuildContext context, UserCubit bloc, UserState state) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
          child: state is UserLoaded
              ? ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text('ID: ${user.id}'),
                    );
                  },
                )
              : const CircularProgressIndicator(),
        ));
  }
}
