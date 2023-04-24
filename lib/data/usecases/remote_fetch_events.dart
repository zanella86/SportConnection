import 'dart:convert';

import 'package:http/http.dart';
import 'package:sport_connection/data/entities/event_entity.dart';
import 'package:sport_connection/domain/enums/tp_event_enum.dart';
import 'package:sport_connection/domain/enums/tp_frequency_enum.dart';
import 'package:sport_connection/domain/models/event_model.dart';
import 'package:sport_connection/domain/usecases/fetch_events.dart';

class RemoteFetchEvents extends FetchEvents {

  @override
  Future<List<EventEntity>> execute() async {
    try {
      final uri = Uri.parse('http://localhost:8080/sc-core/events');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzM4NCJ9.eyJpYXQiOjE2ODIyOTgwMTEsImV4cCI6MTY4MjM1ODAxMSwic3ViIjoibGFpcyJ9.6PWGBV3PvM003a5EeApjnQLFrHDO5qI9Qoj2bUS6v0mcbtYvNmwNw81dtCArOkSR'
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