class ProfileEntity {
  ProfileEntity({
    required this.name,
    required this.userName,
    required this.eventsScore,
    required this.score,
    required this.achievements,
    required this.address,
    required this.profileImage,
  });

  final String name;
  final String userName;
  final int eventsScore;
  final int score;
  final List<String> achievements;
  final String address;
  final String profileImage;
  //statics :B
}
