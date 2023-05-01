import 'package:sport_connection/domain/models/profile_model.dart';

abstract class FetchProfile {
  Future<ProfileModel?> execute({required userName});
}