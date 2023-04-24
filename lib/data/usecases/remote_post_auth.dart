import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sport_connection/data/usecases/remote_config_auth.dart';
import 'package:sport_connection/domain/models/auth_model.dart';
import 'package:sport_connection/domain/models/user_dto_model.dart';
import 'package:sport_connection/domain/usecases/post_auth.dart';

class RemotePostAuth implements PostAuth {

  bool _isGeneratedToken = false;
  String? _token;

  final storage = new FlutterSecureStorage();

  @override
  Future<bool> execute(AuthModel authModel) async {
    print('Authority: ${RemoteConfigAuth.getAuthority()}');
    print('Endpoint: ${RemoteConfigAuth.getLoginEndpoint()}');

    var url = Uri.http(
        RemoteConfigAuth.getAuthority(),
        RemoteConfigAuth.getLoginEndpoint()
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

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if(response.statusCode == 200) {
      _token = jsonDecode(response.body)['token'];
      print('TOKEN: ${getToken()}');
      await storage.write(key: 'access_token', value: getToken());
      return true;
    }
    return false;
  }

  @override
  bool isAuthenticated() {
    print('Authenticated? = $_token');
    if(getToken().isNotEmpty) {  // FIXME Condição não está sendo atendida. Suspeita de "state" incorreto
      print('Autenticado!');
      _isGeneratedToken = true;
    }
    print('Retornando: $_isGeneratedToken');
    return _isGeneratedToken;
  }

  @override
  String getToken() {
    return _token ?? "";
  }

  @override
  Future<UserDTOModel> register(AuthModel authModel) async {
    print('Authority: ${RemoteConfigAuth.getAuthority()}');
    print('Endpoint: ${RemoteConfigAuth.getRegisterEndpoint()}');

    var url = Uri.http(
        RemoteConfigAuth.getAuthority(),  // localhost:8080
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

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return UserDTOModel(id: 0, name: 'lais'); // FIXME Remover mock
  }

}