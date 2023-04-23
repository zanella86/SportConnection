import 'package:sport_connection/data/entities/event_entity.dart';
import 'package:sport_connection/domain/enums/tp_event_enum.dart';
import 'package:sport_connection/domain/enums/tp_frequency_enum.dart';

class EventModel {
  const EventModel({
    required this.name,
    required this.description,
    required this.frequency,
    required this.hour,
    required this.address,
    required this.typeEvent,
    required this.icon,
    required this.paid,
  });

  final String name;
  final String description;
  final TpFrequencyEnum frequency;
  final String hour;
  final String address;
  final TpEventEnum typeEvent;
  final String icon;
  final bool paid;
  
  factory EventModel.fromMap(Map<String, dynamic> map) => EventModel(
      name: map['name'],
      description: map['description'],
      frequency: map['frequency'],
      hour: map['hour'],
      address: map['address'],
      typeEvent: map['typeEvent'],
      icon: map['icon'],
      paid: map['paid']);

  EventEntity toEntity() => EventEntity(name: name, description: description, frequency: frequency, hour: hour, address: address, typeEvent: typeEvent, icon: icon, paid: paid);
  
}