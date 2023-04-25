import 'package:sport_connection/data/usecases/remote_post_auth.dart';
import 'package:sport_connection/domain/models/user_dto_model.dart';
import 'package:sport_connection/domain/models/auth_model.dart';
import 'package:sport_connection/domain/usecases/post_user.dart';

class RemotePostUser extends PostUser {

  @override
  Future<UserDTOModel> execute({required username, required password}) async {
      try {
        return RemotePostAuth().register(AuthModel(username: username, password: password));
      } catch(e) {
        return UserDTOModel(id: 0, name: "");
      }
  }
}