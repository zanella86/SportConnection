import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:sport_connection/data/entities/event_entity.dart';
import 'package:sport_connection/domain/models/event_model.dart';
import 'package:sport_connection/domain/usecases/fetch_events.dart';

class RemoteFetchEvents extends FetchEvents {

  final storage = new FlutterSecureStorage();

  @override
  Future<List<EventEntity>> execute() async {
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

      return responseJson.map<EventEntity>((map) =>
          EventModel.fromMap(map).toEntity())
          .toList();
    } catch (e) {
      print('Fetch Event >>> ${e}');
      return [];
    }
  }
}