import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sport_connection/presentation/widgets/rounded_button.dart';
import 'package:sport_connection/ui/auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

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

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, AuthScreen.id);
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
              child: Column(mainAxisSize: MainAxisSize.min, children: const [
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
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
