import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/user.dart';
import '../../../../core/usecases/use_cases.dart';
import '../repositories/user_repository.dart';

class GetUserUseCase extends UseCase<UserModel, ParametrosGetUser> {
  final HomeRepository homeRepositorio;

  GetUserUseCase({required this.homeRepositorio});
  @override
  Future<Either<Failure, UserModel>> call(ParametrosGetUser params) async {
    return await homeRepositorio.traerUnUsuario(
      id: params.id,
    );
  }
}

class ParametrosGetUser {
  final String id;
  ParametrosGetUser({required this.id});
}
