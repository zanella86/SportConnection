abstract class RemoteConfigAuth {

  static const String _apiBase = "sc-core";
  static const String _loginEndpoint = "users/login";
  static const String _registerEndpoint = "users/register";

  static String getLoginEndpoint() {
    return "/$_apiBase/$_loginEndpoint";
  }

  static String getRegisterEndpoint() {
    return "/$_apiBase/$_registerEndpoint";
  }

}