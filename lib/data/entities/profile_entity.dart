class ProfileEntity {
  ProfileEntity({
    this.id = 0,
    required this.name,
    required this.phone,
    required this.eventParticipated,
    required this.score,
    required this.achievements,
    required this.address,
    this.profileImage = '',
    required this.friends
  });

  final int id;
  final String name;
  final String phone;
  final int eventParticipated;
  final int score;
  final int achievements;
  final int friends;
  final String address;
  final String profileImage;
}
