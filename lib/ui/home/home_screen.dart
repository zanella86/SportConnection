import 'package:flutter/material.dart';
import 'package:sport_connection/presentation/widgets/rounded_button.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RoundedButton(
                      text: 'Teste',
                      onPressed: () => { print('Estou na homepage!!!') },
                    )
                  ]
              ),
            ),
          )
      ),
    );
  }

}