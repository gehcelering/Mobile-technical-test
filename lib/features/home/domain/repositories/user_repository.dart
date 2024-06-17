import 'package:customer/core/errors/failure.dart';
import 'package:customer/core/models/user.dart';
import 'package:customer/core/models/usuarios_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<UsersFailure, UserModel>> traerUnUsuario({
    required String id,
  });

  Future<Either<UsersFailure, List<UsuariosEntity>>> obtenerLosUsuarios();
}
