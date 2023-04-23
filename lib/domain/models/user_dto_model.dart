import 'package:sport_connection/domain/translators/json_translator.dart';

class UserDTOModel implements JsonTranslator<UserDTOModel> {
  const UserDTOModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  UserDTOModel? fromJson(Map<String, dynamic> json) {
    return UserDTOModel(id: json['id'], name: json['name']);
  }

  @override
  Map<String, dynamic> toJson(UserDTOModel model) {
    return {'id': model.id, 'name': model.name};
  }

}