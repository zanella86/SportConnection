import 'package:flutter/material.dart';
import 'package:sport_connection/presentation/widgets/rounded_button.dart';
import 'package:sport_connection/ui/auth/login/login_screen.dart';
import 'package:sport_connection/ui/auth/register/register_screen.dart';
import 'package:sport_connection/ui/home/home_screen.dart';

class AuthScreen extends StatelessWidget {
  static const String id = '/auth_screen';

  const AuthScreen({super.key});

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
                    const SizedBox(height: 64),
                    RoundedButton(
                      text: 'Registrar',
                      onPressed: () => Navigator.pushReplacementNamed(context, RegisterScreen.id),
                    ),
                    const SizedBox(height: 64),
                    RoundedButton(
                      text: 'Logar',
                      onPressed: () => Navigator.pushReplacementNamed(context, LoginScreen.id),
                    ),
                    const SizedBox(height: 64),
                    RoundedButton(
                      text: 'Entrar com Google',
                      onPressed: () => authenticate(context, 'Google'),
                    ),
                    const SizedBox(height: 64),
                    RoundedButton(
                      text: 'Entrar com Github',
                      onPressed: () => authenticate(context, 'Github'),
                    ),
                  ]
              ),
            ),
          )
      ),
    );
  }

  void authenticate(BuildContext context, String oauth2EntityName) {
    bool authenticated = false;

    switch(oauth2EntityName) {  // TODO Criar enum
      case 'Google': {
        authenticated = true;
      }
      break;

      case 'Github': {
        authenticated = true;
      }
      break;

      default: {
        authenticated = false;
      }
      break;
    }

    if(authenticated) {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    }
  }

}