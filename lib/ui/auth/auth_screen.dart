import 'package:flutter/material.dart';
import 'package:sport_connection/presentation/widgets/rounded_button.dart';
import 'package:sport_connection/ui/auth/login/login_screen.dart';
import 'package:sport_connection/ui/auth/register/register_screen.dart';

class AuthScreen extends StatelessWidget {
  static const String id = '/auth_screen';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text(
              'SPORT CONNECTION',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            const Icon(
              Icons.place,
              color: Color.fromRGBO(246, 82, 160, 1),
              size: 60,
            ),
            const SizedBox(height: 64),
            const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/profile.png',
              ),
              radius: 90,
            ),
            const SizedBox(
              height: 16,
              width: double.infinity,
            ),
            const SizedBox(height: 64),
            RoundedButton(
              text: 'Logar',
              textColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.white,
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, LoginScreen.id),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RegisterScreen.id);
                  },
                  child: const Text(
                    'Registrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }

  /*void _authenticate(BuildContext context, String oauth2EntityName) {
    bool authenticated = false;

    switch(oauth2EntityName) {  // Substituir por Enum
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
  }*/
}
