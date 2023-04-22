import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/bloc/profile/profile_cubit.dart';
import 'package:sport_connection/bloc/profile/profile_cubit_state.dart';
import 'package:sport_connection/ui/profile/profile_screen.dart';

class ProfileContainer extends BlocBuilder<ProfileCubit, ProfileCubitState> {
  ProfileContainer({super.key}): super(
    builder: (context, state) {
      return ProfileScreen(
        profile: state.profile
      );
    }
  );
}