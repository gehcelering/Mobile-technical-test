import 'package:customer/core/errors/failure.dart';
import 'package:customer/features/users/domain/models/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<UsersFailure, UserEntity>> getUser({
    required String id,
  });

  Future<Either<UsersFailure, List<UserEntity>>> getUsers();
}
