import 'package:customer/core/models/usuarios_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/use_cases.dart';
import '../repositories/user_repository.dart';

class ObtenerUsuariosUseCase extends UseCase<List<UsuariosEntity>, String> {
  final HomeRepository homeRepositorio;

  ObtenerUsuariosUseCase({required this.homeRepositorio});
  @override
  Future<Either<Failure, List<UsuariosEntity>>> call(String params) async {
    return await homeRepositorio.obtenerLosUsuarios();
  }
}

class ParametrosGetUser {
  final String id;
  ParametrosGetUser({required this.id});
}
