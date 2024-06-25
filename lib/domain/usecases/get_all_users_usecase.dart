import 'package:customer/domain/entities/usuarios_entity.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../../core/helpers/use_cases.dart';
import '../repositories/ihome_repository.dart';

class GetUsersUseCase extends UseCase<List<UserEntity>, String> {
  final IHomeRepository homeRepository;

  GetUsersUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<UserEntity>>> call(String params) async {
    return await homeRepository.getAllUsers();
  }
}

class ParametersGetUser {
  final String id;
  ParametersGetUser({required this.id});
}
