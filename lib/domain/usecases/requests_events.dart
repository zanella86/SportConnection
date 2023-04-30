import 'package:sport_connection/data/entities/event_entity.dart';
import 'package:sport_connection/domain/models/event_dto_model.dart';

abstract class RequestEvents {
  Future<List<EventEntity>> list();
  Future<EventDTOModel?> save(EventDTOModel dtoModel);
  Future<EventDTOModel?> update(EventDTOModel dtoModel);
  Future<bool> delete(int id);
}