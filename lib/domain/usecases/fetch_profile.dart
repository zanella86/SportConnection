import 'package:sport_connection/domain/entities/profile_entity.dart';

abstract class FetchProfile {
  Future<ProfileEntity> execute({required userName});
}