import 'package:flutter/material.dart';
import 'package:sport_connection/presentation/widgets/rounded_button.dart';
import 'package:sport_connection/presentation/widgets/rounded_textfield.dart';
import 'package:sport_connection/ui/auth/login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = '/register_screen';

  RegisterScreen({super.key});

  var inputtedUser = '';
  var inputtedPassword = '';
  var inputtedConfirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
          )
      ),
    );
  }

  bool _comparePasswords() {
    return (inputtedPassword == inputtedConfirmPassword);
  }

  void _validateRegister(BuildContext context) {
    if(inputtedUser.isNotEmpty && inputtedPassword.isNotEmpty && inputtedConfirmPassword.isNotEmpty) {
      if(_comparePasswords()) {
        Navigator.pushReplacementNamed(context, LoginScreen.id);
      } else {
        print("As senhas não podem ser diferentes!");
      }
    } else {
      print("Campo(s) obrigatório(s) não preenchidos!");
    }
  }

}