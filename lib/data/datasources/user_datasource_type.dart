import 'package:sport_connection/data/entities/user_entity.dart';

abstract class UserDatasourceType {
  Future<UserEntity> getUserEntity(int id);
  Future<List<UserEntity>> getUserEntityList();
  void removeUserEntity(UserEntity userEntity);
  void setUserEntity(UserEntity userEntity);
  Future<UserEntity> updateUserEntity(UserEntity userEntity);
}