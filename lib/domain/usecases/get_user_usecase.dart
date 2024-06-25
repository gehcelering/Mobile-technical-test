import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../../data/models/user.dart';
import '../../core/helpers/use_cases.dart';
import '../repositories/ihome_repository.dart';

class GetUserUseCase extends UseCase<UserModel, ParametersGetUser> {
  final IHomeRepository homeRepository;

  GetUserUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, UserModel>> call(ParametersGetUser params) async {
    return await homeRepository.getUser(
      id: params.id,
    );
  }
}

class ParametersGetUser {
  final String id;
  ParametersGetUser({required this.id});
}
