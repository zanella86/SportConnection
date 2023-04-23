import 'package:sport_connection/data/entities/user_entity.dart';
import 'package:sport_connection/domain/models/user_model.dart';

class UserTranslator {

  static UserEntity toEntity({required UserModel userModel}) {
    return UserEntity(
      name: userModel.username,
      password: userModel.password,
    );
  }

  static UserModel toModel({required UserEntity userEntity}) {
    return UserModel(
      username: userEntity.name,
      password: userEntity.password,
    );
  }

}