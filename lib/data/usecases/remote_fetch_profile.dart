import 'dart:convert';

import 'package:http/http.dart';
import 'package:sport_connection/domain/entities/profile_entity.dart';
import 'package:sport_connection/domain/usecases/fetch_profile.dart';

class RemoteFetchProfile extends FetchProfile {
  @override
  Future<ProfileEntity> execute({required userName}) async {
    // TODO: implement execute
    try {
      final uri = Uri.parse('https://demo7206081.mockable.io/movies');
      final response = await Client().get(uri);
      final responseJson = jsonDecode(response.body);

      /*return responseJson['results']
          .map<MovieEntity>((map) => MovieModel.fromMap(map).toEntity())
          .toList();*/

      List<String> achievements = <String>[];
      achievements.add("2x seguidas! Continue assim :D ");
      achievements.add("PARABÉNS! Você participou do seu primeiro evento ");

      return ProfileEntity(
        name: "Lais Kagawa",
        userName: "laisKagawa",
        eventsScore: 99,
        score: 10,
        address: "R. XPTIO 157",
        achievements: achievements,
        profileImage: 'https://w0.peakpx.com/wallpaper/609/744/HD-wallpaper-kakashi-naruto-kakashi-dms-kakashi-naruto-naruto-kakashi-hatake-kakashi-kakashi-uchiha-kakashi-hatake-naruto-shippuden-kakashi-sharingan.jpg'
      );
    } catch (e) {
      return ProfileEntity(
          name: "Lais Kagawa",
          userName: "laisKagawa",
          eventsScore: 10,
          score: 15,
          address: "R. XPTIO 157",
          achievements: [],
          profileImage: 'https://w0.peakpx.com/wallpaper/609/744/HD-wallpaper-kakashi-naruto-kakashi-dms-kakashi-naruto-naruto-kakashi-hatake-kakashi-kakashi-uchiha-kakashi-hatake-naruto-shippuden-kakashi-sharingan.jpg'
      );
    }
  }
}
