import 'package:customer/core/errors/failure.dart';
import 'package:customer/data/datasources/ihome_datasource.dart';
import 'package:customer/data/models/user.dart';
import 'package:customer/domain/entities/usuarios_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/ihome_repository.dart';

class HomeRepositoryImplementacion implements IHomeRepository {
  final IHomeDataSource homeDataSource;

  HomeRepositoryImplementacion({required this.homeDataSource});

  @override
  Future<Either<UsersFailure, UserModel>> getUser({required String id}) async {
    try {
      final result = await homeDataSource.getUser(
        id: id,
      );
      return Right(result);
    } catch (e) {
      return Left(UsersFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<UsersFailure, List<UserEntity>>> getAllUsers() async {
    try {
      final result = await homeDataSource.getAllUsers();
      return Right(result);
    } catch (e) {
      return Left(UsersFailure(message: e.toString()));
    }
  }
}
