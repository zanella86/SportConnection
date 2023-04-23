import 'package:sport_connection/data/usecases/remote_post_auth.dart';
import 'package:sport_connection/domain/models/user_dto_model.dart';
import 'package:sport_connection/domain/models/auth_model.dart';
import 'package:sport_connection/domain/usecases/post_user.dart';

class RemotePostUser extends PostUser {

  @override
  Future<UserDTOModel> execute({required username, required password}) async {
      /*try {
        final uri = Uri.parse('https://demo7206081.mockable.io/movies');
       *//* final response = await Client().post(uri, body: {
          "username" : username,
          "password" : password
        }, encoding: Encoding.getByName("utf-8"));
        final responseJson = jsonDecode(response.body);
      *//*
       *//* return responseJson['results']
            .map<MovieEntity>((map) => MovieModel.fromMap(map).toEntity())
            .toList();*//*
        print('ooooo remote post user');
        return UserDTOModel(id: 1, name: "Lais");

      } catch(e) {
        return UserDTOModel(id: 0, name: "");
      }*/

    return RemotePostAuth().register(AuthModel(username: username, password: password));
  }

}