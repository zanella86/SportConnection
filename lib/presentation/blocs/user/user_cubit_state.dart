import 'package:sport_connection/domain/models/user_dto_model.dart';

class UserCubitState {
  UserCubitState({required this.userDTO});

  final UserDTOModel userDTO;

  UserCubitState copyWith({
    UserDTOModel? userDTO,
  }) =>
      UserCubitState(
        userDTO: userDTO ?? this.userDTO,
      );
}
