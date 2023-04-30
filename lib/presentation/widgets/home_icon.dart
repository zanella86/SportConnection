import 'package:flutter/material.dart';
import 'package:sport_connection/ui/home/home_screen.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, HomeScreen.id);
        },
        icon: const Icon(Icons.home));
  }
}
