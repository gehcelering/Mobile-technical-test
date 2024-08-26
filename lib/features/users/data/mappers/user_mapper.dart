import '../../domain/models/user_entity.dart';
import '../../domain/models/user_model.dart';

class UserMapper {
  static UserEntity userModelToEntity(UserModel userModel) {
    return UserEntity(
      id: userModel.id,
      name: userModel.name,
    );
  }
}
