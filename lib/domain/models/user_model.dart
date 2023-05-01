class UserModel {
  UserModel({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json['username'],
        password: json['password']
  );

  static Map<String, dynamic> toJson(UserModel userModel) => {
    'username' : userModel.username,
    'password' : userModel.password
  };

}