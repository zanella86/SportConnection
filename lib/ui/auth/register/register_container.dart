import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/presentation/blocs/user/user_cubit.dart';
import 'package:sport_connection/presentation/blocs/user/user_cubit_state.dart';
import 'package:sport_connection/ui/auth/login/login_screen.dart';
import 'package:sport_connection/ui/auth/register/register_screen.dart';

class RegisterContainer extends BlocConsumer<UserCubit, UserCubitState> {
  RegisterContainer({super.key}) : super(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        }
      },
      builder: (context, state) {
        return RegisterScreen(
          userDTOModel: state.userDTO,
        );
      }
  );
}