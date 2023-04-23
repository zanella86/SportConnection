import 'package:sport_connection/data/entities/user_entity.dart';

abstract class UserRepositoryType {
  Future<UserEntity> getUserEntity(int id);
  Future<List<UserEntity>> getUserEntityList();
  void setUserEntity(UserEntity userEntity);
  void removeUserEntity(UserEntity userEntity);
  Future<UserEntity> updateUserEntity(UserEntity userEntity);
}