import 'package:flutter/material.dart';
import 'package:sport_connection/ui/event/event_screen.dart';

class EventIcon extends StatelessWidget {
  const EventIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.pushReplacementNamed(context, EventScreen.id);
    }, icon: const Icon(Icons.calendar_today));
  }
}
