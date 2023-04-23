import 'package:sport_connection/data/entities/event_entity.dart';

class EventsCubitState {
  EventsCubitState({required this.eventList});

  final List<EventEntity> eventList;

  EventsCubitState copyWith({
    List<EventEntity>? eventList,
  }) =>
      EventsCubitState(
        eventList: eventList ?? this.eventList,
      );
}
