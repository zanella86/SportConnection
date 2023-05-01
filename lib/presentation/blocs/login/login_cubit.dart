import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/data/usecases/remote_post_login.dart';
import 'package:sport_connection/domain/usecases/post_login.dart';
import 'package:sport_connection/presentation/blocs/login/login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit(
      super.initialState, {
      required this.postLogin,
  });

  PostLogin postLogin;

  Future<void> login(username, password) async {

    emit(state.copyWith(isLoading: true));
    final response = await postLogin.execute(username: username, password: password);
    if(response) {
      emit(state.copyWith(isAuthenticated: true, isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: 'Não foi possível realizar o login'));
    }
  }
}

class LoginCubitProvider extends BlocProvider<LoginCubit> {
  LoginCubitProvider({super.key, Widget? child}) :
      super(
        create: (context) => LoginCubit(
          LoginCubitState(isLoading: false, isAuthenticated: false, errorMessage: ''),
          postLogin: RemotePostLogin(),
        ),
        child: child,
      );

  static LoginCubit of(BuildContext context) => BlocProvider.of(context);
}