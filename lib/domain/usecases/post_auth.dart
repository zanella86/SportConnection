import 'package:sport_connection/domain/models/auth_model.dart';

abstract class PostAuth {
  Future<bool> execute(AuthModel authModel);

  bool isAuthenticated();
  String getToken();
}