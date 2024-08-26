import 'package:customer/features/users/data/datasources/user_data_source.dart';
import 'package:customer/features/users/domain/usecases/get_users_use_case.dart';
import 'package:customer/features/users/presentation/pages/users_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'features/users/data/repositories/user_repository_impl.dart';
import 'features/users/domain/repositories/user_repository.dart';
import 'features/users/domain/usecases/get_user_use_case.dart';
import 'features/users/application/cubit/user_cubit.dart';

GetIt getIt = GetIt.instance;
Future<void> main() async {
  getIt.registerLazySingleton(() => GetUserUseCase(userRepository: getIt()));
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userDataSource: getIt()));
  getIt.registerLazySingleton<UserDataSource>(() => UserDataSourceImpl());
  getIt.registerFactory<UserCubit>(() => UserCubit(getUsers: getIt()));
  getIt.registerLazySingleton(() => GetUsersUseCase(userRepository: getIt()));
  runApp(const MainApp());
}

int g(int a, int b) {
  return a + b;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsersPage(),
    );
  }
}
