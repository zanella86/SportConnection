import 'package:sport_connection/data/entities/user_entity.dart';
import 'package:sport_connection/infra/configs/api_basic_auth_config.dart';

abstract class APIBasicAuthType extends APIBasicAuthConfig {  // TODO: Configurar endpoint
  //@retrofit.GET('/login')
  Future<UserEntity> getUser();
}