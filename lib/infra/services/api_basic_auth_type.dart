import 'package:sport_connection/domain/models/user_dto_model.dart';
import 'package:sport_connection/domain/models/user_model.dart';

abstract class APIBasicAuthType {
  Future<void> authenticate(UserModel userModel);
  Future<UserDTOModel> register(UserModel userModel);
  bool isAuthenticated();
  String? getToken();
}