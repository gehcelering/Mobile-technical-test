import 'package:customer/core/errors/failure.dart';
import 'package:customer/core/models/user.dart';
import 'package:customer/core/models/usuarios_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/homeDataSource.dart';

class HomeRepositoryImplementacion implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImplementacion({required this.homeDataSource});

  @override
  Future<Either<UsersFailure, UserModel>> traerUnUsuario(
      {required String id}) async {
    try {
      final result = await homeDataSource.traerUnUsuario(
        id: id,
      );
      return Right(result);
    } catch (e) {
      return Left(UsersFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<UsersFailure, List<UsuariosEntity>>>
      obtenerLosUsuarios() async {
    try {
      final result = await homeDataSource.usuarios();
      return Right(result);
    } catch (e) {
      return Left(UsersFailure(message: e.toString()));
    }
  }
}
