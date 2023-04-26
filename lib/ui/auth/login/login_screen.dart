import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/presentation/blocs/login/login_cubit.dart';
import 'package:sport_connection/presentation/widgets/custom_message.dart';
import 'package:sport_connection/presentation/widgets/rounded_button.dart';
import 'package:sport_connection/presentation/widgets/rounded_textfield.dart';
import 'package:sport_connection/ui/auth/auth_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login_screen';

  LoginScreen({super.key});

  var inputtedUser = '';
  var inputtedPassword = '';

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            _onBackPressed(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:  loginCubit.state.isLoading ? CustomMessage(message: "Carregando", child: Icon(
            Icons.replay_outlined,
            size: 25,
          ),) :  Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'SPORT CONNECTION',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Icon(
                  Icons.place,
                  color: Color.fromRGBO(246, 82, 160, 1),
                  size: 60,
                ),
                const SizedBox(height: 8,),
                RoundedTextField(
                  label: 'Insira seu usuário',
                  textInputType: TextInputType.name,
                  onTextChange: (text) => inputtedUser = text,
                ),
                const SizedBox(height: 16),
                RoundedTextField(
                  label: 'Senha',
                  obscureText: true,
                  onTextChange: (text) => inputtedPassword = text,
                ),
                const SizedBox(height: 64),
                RoundedButton(
                  text: 'Entrar',
                  onPressed: () => authenticateUserPass(context),
                )
              ]
            ),
          ),
        )
      ),
      bottomNavigationBar: loginCubit.state.errorMessage.isNotEmpty
          ? BottomAppBar(
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Center(
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(loginCubit.state.errorMessage),
                  ),
                );
              },
              child: Text(
                loginCubit.state.errorMessage,
                style: TextStyle(
                  color: Theme.of(context).errorColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          : null,
    );
  }

  void authenticateUserPass(BuildContext context)  {

    if(inputtedUser.isNotEmpty &&
        inputtedPassword.isNotEmpty) {
      context.read<LoginCubit>().login(inputtedUser, inputtedPassword);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário ou senha inválido!')));
    }
  }

  void _onBackPressed(context) {
    Navigator.pushReplacementNamed(context, AuthScreen.id);
  }

}