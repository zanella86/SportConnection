import 'package:sport_connection/domain/models/profile_model.dart';

class ProfileCubitState {
  ProfileCubitState({this.profile});

  final ProfileModel? profile;

  ProfileCubitState copyWith({
    ProfileModel? profile,
  }) =>
      ProfileCubitState(
        profile: profile ?? this.profile,
      );
}
