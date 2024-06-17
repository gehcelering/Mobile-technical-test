import 'package:flutter/material.dart';

import '../../../../core/helpers/base_screen_stateless.dart';
import '../../../../main.dart';
import '../cubit/home_cubit.dart';

class HomePage extends BaseScreen<HomeState, HomeCubit> {
  const HomePage({super.key});

  @override
  HomeCubit createBloc() => getIt<HomeCubit>()..load();

  @override
  Widget buildScreen(BuildContext context, HomeCubit bloc, HomeState state) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Container(
          child: Center(
            child: state is HomeLoaded
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
          ),
        ));
  }
}
