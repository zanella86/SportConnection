import 'package:sport_connection/data/entities/profile_entity.dart';

class ProfileCubitState {
  ProfileCubitState({this.profile});

  final ProfileEntity? profile;

  ProfileCubitState copyWith({
    ProfileEntity? profile,
  }) =>
      ProfileCubitState(
        profile: profile ?? this.profile,
      );
}
