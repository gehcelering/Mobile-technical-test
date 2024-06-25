import 'package:customer/data/datasources/home_datasourece/home_datasource.dart';
import 'package:customer/data/datasources/ihome_datasource.dart';
import 'package:customer/domain/usecases/get_all_users_usecase.dart';
import 'package:customer/presentation/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'data/repositories/user_repository.dart';
import 'domain/repositories/ihome_repository.dart';
import 'domain/usecases/get_user_usecase.dart';
import 'presentation/home/cubit/home_cubit.dart';

GetIt getIt = GetIt.instance;
Future<void> main() async {
  getIt.registerLazySingleton(() => GetUserUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton<IHomeRepository>(
      () => HomeRepositoryImplementacion(homeDataSource: getIt()));
  getIt.registerLazySingleton<IHomeDataSource>(() => HomeDataSourceImpl());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getUsers: getIt()));
  getIt.registerLazySingleton(() => GetUsersUseCase(homeRepository: getIt()));
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
      home: const HomePage(),
    );
  }
}
