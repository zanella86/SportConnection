class AuthEntity {
  const AuthEntity({
    required this.name,
    required this.password,
  });

  final String name;
  final String password;

  factory AuthEntity.fromMap(Map<String, dynamic> map) => AuthEntity(
    name: map['user_name'],
    password: map['user_pass'],
  );

}