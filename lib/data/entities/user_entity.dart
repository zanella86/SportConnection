class UserEntity {
  const UserEntity({
    required this.name,
    required this.password,
  });

  final String name;
  final String password;

  factory UserEntity.fromMap(Map<String, dynamic> map) => UserEntity(
    name: map['user_name'],
    password: map['user_pass'],
  );

}