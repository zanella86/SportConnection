import 'dart:convert';

import 'package:http/http.dart';
import 'package:sport_connection/data/entities/event_entity.dart';
import 'package:sport_connection/domain/models/event_dto_model.dart';
import 'package:sport_connection/domain/models/event_model.dart';
import 'package:sport_connection/domain/usecases/requests_events.dart';
import 'package:sport_connection/infra/config_init.dart';
import 'package:sport_connection/infra/storage_util.dart';

class RemoteRequestsEvents extends RequestEvents {


  @override
  Future<List<EventEntity>> list() async {
    try {
      final username = await StorageUtil.read(key: 'username');
      final token =  await StorageUtil.read(key: 'access_token');

      final uri = Uri.parse('${ConfigInit.getAuthority()}/sc-core/profiles/${username}/events');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      };
      final response = await Client().get(uri, headers: headers);
      final responseJson = jsonDecode(response.body);

      if(responseJson.length == 0){
        return [];
      }

      return responseJson.map<EventEntity>((map) =>
          EventModel.fromMap(map).toEntity())
          .toList();
    } catch (e) {
      return [];
    }
  }
  
  @override
  Future<EventDTOModel?> save(EventDTOModel dtoModel) async {
    try {
      final username = await StorageUtil.read(key: 'username');
      final token = await StorageUtil.read(key: 'access_token');

      final uri = Uri.parse('${ConfigInit.getAuthority()}/sc-core/profiles/${username}/events');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      };

      final response = await Client().post(uri, headers: headers, body: jsonEncode( EventDTOModel.toJson(dtoModel)));
      final responseJson = jsonDecode(response.body);

      return EventDTOModel.fromJson(responseJson);

    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> delete(int id) async {
    try {
      final username = await StorageUtil.read(key: 'username');
      final token = await StorageUtil.read(key: 'access_token');

      final uri = Uri.parse('${ConfigInit.getAuthority()}/sc-core/profiles/${username}/events/${id}');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      };

      final response = await Client().delete(uri, headers: headers);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<EventDTOModel?> update(EventDTOModel dtoModel) async {
    try {
      final username = await StorageUtil.read(key: 'username');
      final token = await StorageUtil.read(key: 'access_token');

      final uri = Uri.parse('${ConfigInit.getAuthority()}/sc-core/profiles/${username}/events/${dtoModel.id}');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      };

      final response = await Client().patch(uri, headers: headers, body: jsonEncode( EventDTOModel.toJson(dtoModel)));
      final responseJson = jsonDecode(response.body);

      return EventDTOModel.fromJson(responseJson);

    } catch (e) {
      return null;
    }
  }
}