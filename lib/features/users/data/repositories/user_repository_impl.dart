import 'package:customer/core/errors/failure.dart';
import 'package:customer/features/users/data/mappers/user_mapper.dart';
import 'package:customer/features/users/domain/models/user_entity.dart';
import 'package:customer/features/users/domain/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<Either<UsersFailure, UserEntity>> getUser({required String id}) async {
    try {
      UserModel userModel = await userDataSource.getUser(
        id: id,
      );
      return Right(UserMapper.userModelToEntity(userModel));
    } catch (e) {
      return Left(UsersFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<UsersFailure, List<UserEntity>>> getUsers() async {
    try {
      List<UserModel> userModelList = await userDataSource.getUsers();
      return Right(userModelList
          .map((userModel) => UserMapper.userModelToEntity(userModel))
          .toList());
    } catch (e) {
      return Left(UsersFailure(message: e.toString()));
    }
  }
}
