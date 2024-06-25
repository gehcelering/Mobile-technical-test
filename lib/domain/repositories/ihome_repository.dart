import 'package:customer/core/errors/failure.dart';
import 'package:customer/data/models/user.dart';
import 'package:customer/domain/entities/usuarios_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeRepository {
  Future<Either<UsersFailure, UserModel>> getUser({
    required String id,
  });

  Future<Either<UsersFailure, List<UserEntity>>> getAllUsers();
}
