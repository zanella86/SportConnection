import 'package:sport_connection/data/entities/profile_entity.dart';

class ProfileModel {
  ProfileModel({
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

  factory ProfileModel.fromMap(Map<String, dynamic> map) => ProfileModel(
        name: map['name'],
        userName: map['userName'],
        eventsScore: map['eventsScore'],
        score: map['score'],
        achievements: map['achievements'],
        address: map['address'],
        profileImage: map['profileImage'],
      );

  ProfileEntity toEntity() => ProfileEntity(name: name, userName: userName, eventsScore: eventsScore, score: score, achievements: achievements, address: address, profileImage: profileImage);
}
