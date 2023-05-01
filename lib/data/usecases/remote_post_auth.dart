import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sport_connection/data/usecases/remote_config_auth.dart';
import 'package:sport_connection/domain/models/auth_model.dart';
import 'package:sport_connection/domain/models/user_dto_model.dart';
import 'package:sport_connection/domain/usecases/post_auth.dart';
import 'package:sport_connection/infra/config_init.dart';

class RemotePostAuth implements PostAuth {

  bool _isGeneratedToken = false;
  String? _token;

  final storage = new FlutterSecureStorage();

  @override
  Future<bool> execute(AuthModel authModel) async {
    var url = Uri.http(
        ConfigInit.getAuthority(),
        RemoteConfigAuth.getLoginEndpoint()
    );
    var response = await http.post(
        url,
        headers: <String, String> {
          "Content-Type" : "application/json",
        },
        body: jsonEncode(
            {authModel},
            toEncodable: (toEncodable) => AuthModel.toJson(authModel)
        )
    );

    if(response.statusCode == 200) {
      _token = jsonDecode(response.body)['token'];
      await storage.write(key: 'access_token', value: getToken());
      await storage.write(key: 'username', value: authModel.username);
      return true;
    }
    return false;
  }

  @override
  bool isAuthenticated() {
    if(getToken().isNotEmpty) {
      _isGeneratedToken = true;
    }
    return _isGeneratedToken;
  }

  @override
  String getToken() {
    return _token ?? "";
  }

  @override
  Future<UserDTOModel> register(AuthModel authModel) async {

    var url = Uri.http(
        ConfigInit.getAuthority(),  // localhost:8080
        RemoteConfigAuth.getRegisterEndpoint()  // /sc-core/users/register
    );
    var response = await http.post(
        url,
        headers: <String, String> {
          //"Access-Control-Allow-Origin" : "*",
          "Content-Type" : "application/json",
          //"Accept" : "*/*",
        },
        body: jsonEncode(
            {authModel},
            toEncodable: (toEncodable) => AuthModel.toJson(authModel)
        )
    );

    Map<String, dynamic> responseJson = jsonDecode(response.body);
    return UserDTOModel.fromMap(responseJson);
  }

}