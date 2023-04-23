import 'package:sport_connection/domain/models/user_dto_model.dart';

abstract class PostUser {
  Future<UserDTOModel> execute({required username, required password});
}