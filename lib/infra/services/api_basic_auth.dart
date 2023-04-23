import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sport_connection/domain/models/user_dto_model.dart';
import 'package:sport_connection/domain/models/user_model.dart';
import 'package:sport_connection/infra/configs/api_basic_auth_config.dart';
import 'package:sport_connection/infra/services/api_basic_auth_type.dart';

class APIBasicAuth implements APIBasicAuthType {

  bool _isGeneratedToken = false;
  String? _token;

  @override
  Future<void> authenticate(UserModel userModel) async {
    print('Authority: ${APIBasicAuthConfig.getAuthority()}');
    print('Endpoint: ${APIBasicAuthConfig.getLoginEndpoint()}');

    var url = Uri.http(
        APIBasicAuthConfig.getAuthority(),
        APIBasicAuthConfig.getLoginEndpoint()
    );
    var response = await http.post(
        url,
        headers: <String, String> {
          //"Access-Control-Allow-Origin" : "*",
          "Content-Type" : "application/json",
          //"Accept" : "*/*",
        },
        body: jsonEncode(
            {userModel},
            toEncodable: (toEncodable) => userModel.toJson(userModel)
        )
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if(response.statusCode == 200) {
      _token = jsonDecode(response.body)['token'];
      print('TOKEN: ${getToken()}');
    }

  }

  @override
  bool isAuthenticated() {
    print('Authenticated? = $_token');
    if(getToken() != "") {  // FIXME Condição não está sendo atendida. Suspeita de "state" incorreto
      print('Autenticado!');
      _isGeneratedToken = true;
    }
    print('Retornando: $_isGeneratedToken');
    return _isGeneratedToken;
  }

  @override
  String? getToken() {
    return _token ?? "";
  }

  @override
  Future<UserDTOModel> register(UserModel userModel) async {
    print('Authority: ${APIBasicAuthConfig.getAuthority()}');
    print('Endpoint: ${APIBasicAuthConfig.getRegisterEndpoint()}');

    var url = Uri.http(
        APIBasicAuthConfig.getAuthority(),  // localhost:8080
        APIBasicAuthConfig.getRegisterEndpoint()  // /sc-core/users/register
    );
    var response = await http.post(
        url,
        headers: <String, String> {
          //"Access-Control-Allow-Origin" : "*",
          "Content-Type" : "application/json",
          //"Accept" : "*/*",
        },
        body: jsonEncode(
            {userModel},
            toEncodable: (toEncodable) => userModel.toJson(userModel)
        )
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return UserDTOModel(id: 0, name: 'lais'); // FIXME Remover mock
  }

}