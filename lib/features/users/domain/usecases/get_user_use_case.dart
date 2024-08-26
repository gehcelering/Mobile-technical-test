import 'package:customer/features/users/domain/models/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/use_cases.dart';
import '../repositories/user_repository.dart';

class GetUserUseCase extends UseCase<UserEntity, ParametrosGetUser> {
  final UserRepository userRepository;

  GetUserUseCase({required this.userRepository});
  @override
  Future<Either<Failure, UserEntity>> call(ParametrosGetUser params) async {
    return await userRepository.getUser(
      id: params.id,
    );
  }
}

class ParametrosGetUser {
  final String id;
  ParametrosGetUser({required this.id});
}
