import 'package:sport_connection/data/repositories/user_repository_type.dart';
import 'package:sport_connection/domain/models/user_model.dart';
import 'package:sport_connection/domain/translators/user_translator.dart';
import 'package:sport_connection/domain/usecases/user_usecase_type.dart';

class UserUseCase implements UserUseCaseType {

  UserUseCase({required this.userRepositoryType});

  final UserRepositoryType userRepositoryType;

  @override
  Future<UserModel> getUserModel() async {
    final userEntity = await userRepositoryType.getUserEntity();
    return UserTranslator.toModel(userEntity: userEntity);
  }

  @override
  Future<List<UserModel>> getUserModelList() {
    // TODO: implement getUserModelList
    throw UnimplementedError();
  }

  @override
  void removeUserModel(UserModel userModel) {
    // TODO: implement removeUserModel
  }

  @override
  void setUserModel(UserModel userModel) {
    // TODO: implement setUserModel
  }

  @override
  Future<UserModel> updateUserModel(UserModel userModel) {
    // TODO: implement updateUserModel
    throw UnimplementedError();
  }

}