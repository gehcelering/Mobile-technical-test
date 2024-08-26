import 'package:customer/features/users/domain/models/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/use_cases.dart';
import '../repositories/user_repository.dart';

class GetUsersUseCase extends UseCase<List<UserEntity>, String> {
  final UserRepository userRepository;

  GetUsersUseCase({required this.userRepository});
  @override
  Future<Either<Failure, List<UserEntity>>> call(String params) async {
    return await userRepository.getUsers();
  }
}

class ParametrosGetUser {
  final String id;
  ParametrosGetUser({required this.id});
}
