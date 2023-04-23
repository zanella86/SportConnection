import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/data/usecases/remote_post_user.dart';
import 'package:sport_connection/domain/models/user_dto_model.dart';
import 'package:sport_connection/domain/usecases/post_user.dart';
import 'package:sport_connection/presentation/blocs/user/user_cubit_state.dart';

class UserCubit extends Cubit<UserCubitState> {
  UserCubit(
      super.initialState, {
        required this.postUser,
  });

  PostUser postUser;

  Future<void> post(username, password) async {
    final userDto = await postUser.execute(username: username, password: password);

    print('ant emit ${userDto.id}');
    emit(state.copyWith(userDTO: userDto));
  }
}

class UserCubitProvider extends BlocProvider<UserCubit> {
  UserCubitProvider({super.key, Widget? child})
  : super (
    create: (context) => UserCubit(
      UserCubitState(userDTO: UserDTOModel(id: 0, name: "")),
      postUser: RemotePostUser(),
    ),
    child: child,
  );

  static UserCubit of (BuildContext context) => BlocProvider.of(context);
}