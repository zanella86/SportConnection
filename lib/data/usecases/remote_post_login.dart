import 'package:sport_connection/data/usecases/remote_post_auth.dart';
import 'package:sport_connection/domain/models/auth_model.dart';
import 'package:sport_connection/domain/usecases/post_login.dart';

class RemotePostLogin implements PostLogin {

  @override
  Future<bool> execute({required username, required password}) {
    try {
      return RemotePostAuth().execute(AuthModel(username: username, password: password));
    } catch(e) {
      return false as Future<bool>;
    }
  }

}