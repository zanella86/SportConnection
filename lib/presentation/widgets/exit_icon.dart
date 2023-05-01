import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sport_connection/ui/auth/login/login_screen.dart';

class ExitIcon extends StatelessWidget {
  const ExitIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () async {
      final storage = new FlutterSecureStorage();
      await storage.delete(key: 'access_token');
      await storage.delete(key: 'username');
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    },  icon: const Icon(Icons.logout),
    );
  }
}
