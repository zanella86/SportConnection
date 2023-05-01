class AuthModel {
  AuthModel({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
      username: json['username'],
      password: json['password']
  );

  static Map<String, dynamic> toJson(AuthModel userModel) => {
    'username' : userModel.username,
    'password' : userModel.password
  };

}