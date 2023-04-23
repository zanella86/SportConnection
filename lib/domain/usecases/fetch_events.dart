import 'package:sport_connection/data/entities/event_entity.dart';

abstract class FetchEvents {
  Future<List<EventEntity>> execute();
}