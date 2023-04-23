import 'package:sport_connection/domain/models/user_dto_model.dart';

class UserCubitState {
  UserCubitState({required this.userDTO, this.isLoading = false, this.isSuccess = false});

  final UserDTOModel userDTO;
  final bool isLoading;
  final bool isSuccess;

  UserCubitState copyWith({
    UserDTOModel? userDTO,
    bool? isLoading,
    bool? isSuccess,
  }) =>
      UserCubitState(
        userDTO: userDTO ?? this.userDTO,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
      );
}
