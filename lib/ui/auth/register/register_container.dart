import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/presentation/blocs/user/user_cubit.dart';
import 'package:sport_connection/presentation/blocs/user/user_cubit_state.dart';
import 'package:sport_connection/ui/auth/register/register_screen.dart';

class RegisterContainer extends BlocBuilder<UserCubit, UserCubitState> {
  RegisterContainer({super.key}) : super(
      builder: (context, state) {
        return RegisterScreen(
          userDTOModel: state.userDTO,
        );
      }
  );
}