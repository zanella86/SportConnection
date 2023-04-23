import 'package:flutter/material.dart';
import 'package:sport_connection/domain/models/auth_model.dart';
import 'package:sport_connection/data/usecases/remote_post_auth.dart';
import 'package:sport_connection/presentation/widgets/rounded_button.dart';
import 'package:sport_connection/presentation/widgets/rounded_textfield.dart';
import 'package:sport_connection/ui/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login_screen';

  LoginScreen({super.key});

  var inputtedUser = '';
  var inputtedPassword = '';

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
    );
  }

  void authenticateUserPass(BuildContext context) async {
    RemotePostAuth remotePostAuth = RemotePostAuth();
    //remotePostAuth.execute(AuthModel(username: inputtedUser, password: inputtedPassword));
    //if(remotePostAuth.isAuthenticated()) {
    if(await remotePostAuth.execute(AuthModel(username: inputtedUser, password: inputtedPassword))) {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário ou senha inválido!')));
    }
  }

}