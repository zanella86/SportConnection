import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sport_connection/infra/config_init.dart';
import 'package:sport_connection/ui/auth/auth_screen.dart';
import 'package:sport_connection/ui/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash_screen';

  const SplashScreen({
    Key? key
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.addStatusListener((status) async {
      var username = await storage.read(key: "username");
      if (status == AnimationStatus.completed) {
        print('Authority: ' + ConfigInit.getAuthority());
        if (username != null && username.toString().isNotEmpty) {
          Navigator.pushReplacementNamed(context, HomeScreen.id);
        }else {
          Navigator.pushReplacementNamed(context, AuthScreen.id);
        }
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: FadeTransition(
          opacity: _animation,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                Text(
                  'SPORT CONNECTION',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 18,
                ),
                Icon(
                  Icons.place,
                  color: Color.fromRGBO(246, 82, 160, 1),
                  size: 60,
                ),
                SizedBox(
                  height: 56,
                ),
                Text(
                  'Verificando usuário logado...',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
