import 'package:sport_connection/domain/models/user_dto_model.dart';
import 'package:sport_connection/domain/models/user_model.dart';
import 'package:sport_connection/domain/usecases/post_user.dart';
import 'package:sport_connection/infra/services/api_basic_auth.dart';

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

    APIBasicAuth apiBasicAuth = APIBasicAuth();
    return apiBasicAuth.register(UserModel(username: username, password: password));
  }

}