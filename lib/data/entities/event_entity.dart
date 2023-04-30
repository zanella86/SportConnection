import 'package:sport_connection/domain/enums/event_type.dart';
import 'package:sport_connection/domain/enums/frequency.dart';

class EventEntity {
  const EventEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.frequency,
    required this.time,
    required this.address,
    required this.typeEvent,
    required this.icon,
    required this.paid,
  });

  final int id;
  final String name;
  final String description;
  final Frequency frequency;
  final String time;
  final String address;
  final EventType typeEvent;
  final String icon;
  final bool paid;
}
