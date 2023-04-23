import 'package:sport_connection/data/datasources/user_datasource_type.dart';
import 'package:sport_connection/data/entities/user_entity.dart';
import 'package:sport_connection/data/repositories/user_repository_type.dart';

class UserRepository implements UserRepositoryType {

  UserRepository({required this.userDatasourceType});

  final UserDatasourceType userDatasourceType;

  @override
  Future<UserEntity> getUserEntity(int id) async {
    return await userDatasourceType.getUserEntity(id);
  }

  @override
  Future<List<UserEntity>> getUserEntityList() async {
    // TODO: implement getUserEntityList
    throw UnimplementedError();
  }

  @override
  void removeUserEntity(UserEntity userEntity) {
    // TODO: implement removeUserEntity
  }

  @override
  void setUserEntity(UserEntity userEntity) {
    // TODO: implement setUserEntity
  }

  @override
  Future<UserEntity> updateUserEntity(UserEntity userEntity) {
    // TODO: implement updateUserEntity
    throw UnimplementedError();
  }

}