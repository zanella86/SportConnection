import 'package:settings_yaml/settings_yaml.dart';

class ConfigInit {

  static SettingsYaml _load() {
    return SettingsYaml.load(pathToSettings: '/config.yaml');
  }

  static String getAuthority() {
    /*final config = ConfigInit._load();
    String host = config.asString('server.host');
    String port = config.asInt('server.port').toString();*/
    String host = "http://localhost";
    String port = "8080";
    return port.isEmpty ? host : "$host:$port";
  }

}