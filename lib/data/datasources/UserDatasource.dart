import 'package:sport_connection/data/datasources/user_datasource_type.dart';
import 'package:sport_connection/data/entities/user_entity.dart';
import 'package:sport_connection/infra/services/api_basic_auth_type.dart';

class UserDatasource implements UserDatasourceType {

  UserDatasource({required this.apiBasicAuthType});

  final APIBasicAuthType apiBasicAuthType;

  @override
  Future<UserEntity> getUserEntity(int id) async {
    //return await apiBasicAuthType.;
    throw UnimplementedError();
  }

  @override
  Future<List<UserEntity>> getUserEntityList() {
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