import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/domain/models/user_dto_model.dart';
import 'package:sport_connection/presentation/blocs/user/user_cubit.dart';
import 'package:sport_connection/presentation/widgets/rounded_button.dart';
import 'package:sport_connection/presentation/widgets/rounded_textfield.dart';
import 'package:sport_connection/ui/auth/auth_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = '/register_screen';

  RegisterScreen({super.key, required this.userDTOModel});

  UserDTOModel userDTOModel;

  var inputtedUser = '';
  var inputtedPassword = '';
  var inputtedConfirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
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
            child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                    const SizedBox(height: 16),
                    RoundedTextField(
                      label: 'Confirmação de senha',
                      obscureText: true,
                      onTextChange: (text) => inputtedConfirmPassword = text,
                    ),
                    const SizedBox(height: 64),
                    RoundedButton(
                      text: 'Registrar',
                      onPressed: () => _validateRegister(context),
                    )
                  ]
              ),
            ),
          )),
    );
  }

  bool _comparePasswords() {
    return (inputtedPassword == inputtedConfirmPassword);
  }

  void _validateRegister(BuildContext context) {
    if(inputtedUser.isNotEmpty &&
        inputtedPassword.isNotEmpty &&
        inputtedConfirmPassword.isNotEmpty) {
      if(_comparePasswords()) {
        context.read<UserCubit>().post(inputtedUser, inputtedPassword);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('A senha está diferente da confirmação')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Campo(s) obrigatório(s) não preenchidos!')));
    }
  }

  void _onBackPressed(context) {
    Navigator.pushReplacementNamed(context, AuthScreen.id);
  }

}
