import 'package:customer/data/models/user.dart';
import 'package:customer/domain/entities/usuarios_entity.dart';

abstract class IHomeDataSource {
  Future<UserModel> getUser({
    required String id,
  });

  Future<List<UserEntity>> getAllUsers();
}
