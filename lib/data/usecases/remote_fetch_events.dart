import 'dart:convert';

import 'package:http/http.dart';
import 'package:sport_connection/domain/entities/event_entity.dart';
import 'package:sport_connection/domain/enums/tp_event_enum.dart';
import 'package:sport_connection/domain/enums/tp_frequency_enum.dart';
import 'package:sport_connection/domain/usecases/fetch_events.dart';

class RemoteFetchEvents extends FetchEvents {

  @override
  Future<List<EventEntity>> execute() async {
    // TODO: implement execute
    try {
      final uri = Uri.parse('https://demo7206081.mockable.io/movies');
      final response = await Client().get(uri);
      final responseJson = jsonDecode(response.body);

      /*return responseJson['results']
          .map<MovieEntity>((map) => MovieModel.fromMap(map).toEntity())
          .toList();*/

      List<EventEntity> mock = <EventEntity>[];
      mock.add(EventEntity(name: 'Basquete - PRO', description: 'Jogo basquete lá na quadrinha', frequency: TpFrequencyEnum.ONE_TIME, hour: '', address: '', typeEvent: TpEventEnum.RANKED, icon: '', paid: false));
      mock.add(EventEntity(name: 'Futebol da escola', description: 'Teste', frequency: TpFrequencyEnum.ONE_TIME, hour: '', address: '', typeEvent: TpEventEnum.LEARN, icon: '', paid: false));
      mock.add(EventEntity(name: 'Amigos do Rodrigo', description: 'Futebolzinho com o pessoal da vila', frequency: TpFrequencyEnum.ONE_TIME, hour: '', address: '', typeEvent: TpEventEnum.FUN, icon: '', paid: false));

      return mock;

    } catch (e) {
      return [];
    }
  }

}