import 'package:settings_yaml/settings_yaml.dart';

class ConfigInit {

  static SettingsYaml _load() {
    return SettingsYaml.load(pathToSettings: 'assets/config/config.yaml');
  }

  static String getAuthority() {
    /*final config = ConfigInit._load();
    String protocol = config.selectAsString('protocol') ?? "http";
    String host = config.selectAsString('host') ?? "localhost";
    String port = (config.selectAsInt('port') ?? 8080).toString();*/
    String protocol = "http";
    String host = "localhost";
    String port = "8080";
    return port.isEmpty ? host : "$protocol://$host:$port";
  }

}