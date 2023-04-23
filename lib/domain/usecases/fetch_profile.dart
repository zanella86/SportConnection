import 'package:sport_connection/data/entities/profile_entity.dart';

abstract class FetchProfile {
  Future<ProfileEntity> execute({required userName});
}