import 'package:sport_connection/domain/entities/event_entity.dart';

abstract class FetchEvents {
  Future<List<EventEntity>> execute();
}