import 'dart:convert';

import 'package:http/http.dart';
import 'package:sport_connection/domain/models/profile_model.dart';
import 'package:sport_connection/domain/usecases/fetch_profile.dart';
import 'package:sport_connection/infra/config_init.dart';
import 'package:sport_connection/infra/storage_util.dart';

class RemoteFetchProfile extends FetchProfile {
  @override
  Future<ProfileModel?> execute({required userName}) async {
    try {
      final username = await StorageUtil.read(key: 'username');
      final token = await StorageUtil.read(key: 'access_token');

      final uri = Uri.parse('${ConfigInit.getAuthority()}/sc-core/profiles/${username}');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      };

      final response = await Client().get(uri, headers: headers);
      final responseJson = jsonDecode(response.body);
      return ProfileModel.fromMap(responseJson);
    } catch (e) {
      print('Remote Profile >> ${e}');
      return null;
    }
  }

}
