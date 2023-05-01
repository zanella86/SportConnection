import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageUtil {
  static final _storage = new FlutterSecureStorage();

  static Future<void> write(
      {required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  static Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }
}
