class LoginDTOReponse {
  LoginDTOReponse({
    required this.token,
  });

  final String token;

  factory LoginDTOReponse.fromJson(Map<String, dynamic> json) => LoginDTOReponse(
      token: json['token']
  );

  static Map<String, dynamic> toJson(LoginDTOReponse login) => {
    'token' : login.token,
  };

}