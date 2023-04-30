import 'package:flutter/material.dart';
import 'package:sport_connection/ui/profile/profile_screen.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, ProfileScreen.id);
        },
        icon: const Icon(Icons.person));
  }
}
