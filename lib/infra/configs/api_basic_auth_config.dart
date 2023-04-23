abstract class APIBasicAuthConfig {

  static const String _server = "localhost";
  static const String _port = "8080";
  static const String _apiBase = "sc-core";

  static const String _loginEndpoint = "users/login";
  static const String _registerEndpoint = "users/register";
  static const String _eventsEndpoint = "events";

  static String getAuthority() {
    return _port.isEmpty ? _server : "$_server:$_port";
  }

  static String getLoginEndpoint() {
    return "/$_apiBase/$_loginEndpoint";
  }

  static String getRegisterEndpoint() {
    return "/$_apiBase/$_registerEndpoint";
  }

  static String getEventsEndpoint() {
    return "/$_apiBase/$_eventsEndpoint";
  }

}