import 'package:sport_connection/data/entities/profile_entity.dart';

class ProfileModel {
  ProfileModel(
      {this.id = 0,
      required this.name,
      required this.phone,
      required this.eventParticipated,
      required this.score,
      required this.achievements,
      required this.address,
      this.profileImage = '',
      required this.friends});

  final int id;
  final String name;
  final String phone;
  final int eventParticipated;
  final int score;
  final int achievements;
  final int friends;
  final String address;
  final String profileImage;

  factory ProfileModel.fromMap(Map<String, dynamic> map) => ProfileModel(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        phone: map['phone'] ?? '',
        eventParticipated: map['eventsParticipated'],
        score: map['score'],
        achievements: map['achievements'],
        friends: map['friends'],
        address: map['address'] ?? '',
        profileImage: map['profileImage'] ?? '',
      );



  ProfileEntity toEntity() => ProfileEntity(
        id: id,
        name: name,
        phone: phone,
        eventParticipated: eventParticipated,
        score: score,
        achievements: achievements,
        friends: friends,
        address: address,
        profileImage: profileImage,
      );
}
