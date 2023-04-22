import 'package:flutter/material.dart';
import 'package:sport_connection/ui/profile/profile_screen.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key, required this.items }) : super(key: key);

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.primary,
      shape: const CircularNotchedRectangle(),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        ),
      ),
    );
  }
}
