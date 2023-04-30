import 'package:sport_connection/data/entities/event_entity.dart';
import 'package:sport_connection/domain/enums/event_type.dart';
import 'package:sport_connection/domain/enums/frequency.dart';

class EventModel {
  const EventModel({
    this.id = 0,
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


  
  factory EventModel.fromMap(Map<String, dynamic> map) => EventModel(
      id: map['id'] ?? 0,
      name: map['name'],
      description: map['description'],
      frequency: FrequencyUtils.fromString(map['frequency']),
      time: map['time'],
      address: map['address'],
      typeEvent: EventTypeUtils.fromString(map['typeEvent']) ,
      icon: map['icon'] ?? '',
      paid: map['paid']);

  EventEntity toEntity() => EventEntity(id: id, name: name, description: description, frequency: frequency, time: time, address: address, typeEvent: typeEvent, icon: icon, paid: paid);

}
