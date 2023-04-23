import 'package:sport_connection/domain/models/user_model.dart';

abstract class APIBasicAuthType {
  Future<void> authenticate(UserModel userModel);
  bool isAuthenticated();
  String? getToken();
}