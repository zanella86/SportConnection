import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:sport_connection/data/entities/event_entity.dart';
import 'package:sport_connection/domain/models/event_dto_model.dart';
import 'package:sport_connection/domain/models/event_model.dart';
import 'package:sport_connection/domain/usecases/requests_events.dart';

class RemoteRequestsEvents extends RequestEvents {

  final storage = new FlutterSecureStorage();

  @override
  Future<List<EventEntity>> list() async {
    try {
      final uri = Uri.parse('http://localhost:8080/sc-core/events');

      final token = await storage.read(key: 'access_token');
      print('token -> ${token}');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      };
      final response = await Client().get(uri, headers: headers);
      final responseJson = jsonDecode(response.body);

      if(responseJson.length == 0){
        return [];
      }
      print(responseJson);

      return responseJson.map<EventEntity>((map) =>
          EventModel.fromMap(map).toEntity())
          .toList();
    } catch (e) {
      print('Fetch Event >>> ${e}');
      return [];
    }
  }
  
  @override
  Future<EventDTOModel?> save(EventDTOModel dtoModel) async {
    try {
      final uri = Uri.parse('http://localhost:8080/sc-core/events');
      final token = await storage.read(key: 'access_token');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      };

      final response = await Client().post(uri, headers: headers, body: jsonEncode( EventDTOModel.toJson(dtoModel)));
      final responseJson = jsonDecode(response.body);

      return EventDTOModel.fromJson(responseJson);

    } catch (e) {
      print('Save Event >>> ${e}');
      return null;
    }
  }

  @override
  Future<bool> delete(int id) async {
    try {
      final uri = Uri.parse('http://localhost:8080/sc-core/events/${id}');
      final token = await storage.read(key: 'access_token');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      };

      final response = await Client().delete(uri, headers: headers);
      //final responseJson = jsonDecode(response.body);

      return true;

    } catch (e) {
      print('Delete Event >>> ${e}');
      return false;
    }
  }

  @override
  Future<EventDTOModel?> update(EventDTOModel dtoModel) {
    // TODO: implement update
    throw UnimplementedError();
  }
}