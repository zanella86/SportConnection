import 'package:sport_connection/domain/translators/json_translator.dart';

class UserModel implements JsonTranslator<UserModel> {
  UserModel({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  UserModel? fromJson(Map<String, dynamic> json) {
    return UserModel(username: json['username'], password: json['password']);
  }

  @override
  Map<String, dynamic> toJson(UserModel model) {
    return {'username': model.username, 'password': model.password};
  }

  /*factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json['username'],
        password: json['password']
  );*/

  /*static Map<String, dynamic> toJson(UserModel userModel) => {
    'username' : userModel.username,
    'password' : userModel.password
  };*/

}