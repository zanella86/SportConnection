import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/domain/models/user_dto_model.dart';
import 'package:sport_connection/presentation/blocs/user/user_cubit.dart';
import 'package:sport_connection/presentation/blocs/user/user_cubit_state.dart';
import 'package:sport_connection/presentation/widgets/rounded_button.dart';
import 'package:sport_connection/presentation/widgets/rounded_textfield.dart';
import 'package:sport_connection/ui/auth/login/login_screen.dart';

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
              child:
              Column(mainAxisSize: MainAxisSize.min, children: [
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
                  onTextChange: (text) =>
                  inputtedConfirmPassword = text,
                ),
                const SizedBox(height: 64),
                RoundedButton(
                  text: 'Registrar',
                  onPressed: () => validateRegister(context),
                )
              ]),
            ),
          )),
    );

   /* return BlocConsumer<UserCubit, UserCubitState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        }
      },
      builder: (context, state) {
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
              child: state.isLoading
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
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
                            onTextChange: (text) =>
                                inputtedConfirmPassword = text,
                          ),
                          const SizedBox(height: 64),
                          RoundedButton(
                            text: 'Registrar',
                            onPressed: () => validateRegister(context),
                          )
                        ]),
                      ),
                    )),
        );
      },
    );*/
  }

  bool comparePasswords() {
    return (inputtedPassword == inputtedConfirmPassword);
  }

  void validateRegister(BuildContext context) {
    if (inputtedUser.isNotEmpty &&
        inputtedPassword.isNotEmpty &&
        inputtedConfirmPassword.isNotEmpty) {
      if (comparePasswords()) {
        context.read<UserCubit>().post(inputtedUser, inputtedPassword);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('A senha esta diferente da confirmação')));
      }
    }
  }

  void _onBackPressed(context) {
    Navigator.pushReplacementNamed(context, LoginScreen.id);
  }
}
