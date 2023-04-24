import 'package:sport_connection/domain/enums/tp_event_enum.dart';
import 'package:sport_connection/domain/enums/tp_frequency_enum.dart';

class EventEntity {
  const EventEntity({
    required this.name,
    required this.description,
    required this.frequency,
    required this.time,
    required this.address,
    required this.typeEvent,
    required this.icon,
    required this.paid,
  });

  final String name;
  final String description;
  final TpFrequencyEnum frequency;
  final String time;
  final String address;
  final TpEventEnum typeEvent;
  final String icon;
  final bool paid;
}
