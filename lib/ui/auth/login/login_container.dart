import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/presentation/blocs/login/login_cubit.dart';
import 'package:sport_connection/presentation/blocs/login/login_cubit_state.dart';
import 'package:sport_connection/ui/auth/login/login_screen.dart';
import 'package:sport_connection/ui/home/home_screen.dart';

class LoginContainer extends BlocConsumer<LoginCubit, LoginCubitState> {
  LoginContainer({super.key})
      : super(listener: (context, state) {
          if (state.isAuthenticated) {
            Navigator.pushReplacementNamed(context, HomeScreen.id);
          }
        }, builder: (context, state) {
          return LoginScreen();
        });
}
