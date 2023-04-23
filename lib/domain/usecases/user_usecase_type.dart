import 'package:sport_connection/domain/models/user_model.dart';

abstract class UserUseCaseType {
  Future<UserModel> getUserModel(int id);
  Future<List<UserModel>> getUserModelList();
  void setUserModel(UserModel userModel);
  void removeUserModel(UserModel userModel);
  Future<UserModel> updateUserModel(UserModel userModel);
}