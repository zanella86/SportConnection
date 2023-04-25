class UserDTOModel {
  const UserDTOModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory UserDTOModel.fromMap(Map<String, dynamic> map) => UserDTOModel(
    name: map['username'],
    id: map['id'],
  );

}