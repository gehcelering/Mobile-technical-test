import 'package:customer/features/home/data/datasources/homeDataSource.dart';
import 'package:customer/features/home/domain/usecases/getUsuariosuseCase.dart';
import 'package:customer/features/home/presentation/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'features/home/data/repositories/user_repository.dart';
import 'features/home/domain/repositories/user_repository.dart';
import 'features/home/domain/usecases/obtener_usuarios.dart';
import 'features/home/presentation/cubit/home_cubit.dart';

GetIt getIt = GetIt.instance;
Future<void> main() async {
  getIt.registerLazySingleton(() => GetUserUseCase(homeRepositorio: getIt()));
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplementacion(homeDataSource: getIt()));
  getIt.registerLazySingleton<HomeDataSource>(() => HomedatasourceImpl());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getUsers: getIt()));
  getIt.registerLazySingleton(
      () => ObtenerUsuariosUseCase(homeRepositorio: getIt()));
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
