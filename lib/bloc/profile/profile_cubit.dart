import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/bloc/profile/profile_cubit_state.dart';
import 'package:sport_connection/data/usecases/remote_fetch_profile.dart';
import 'package:sport_connection/domain/usecases/fetch_profile.dart';

class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit(
    super.initialState, {
    required this.fetchProfile,
  });

  FetchProfile fetchProfile;

  Future<void> fetch() async {
    //TODO - recuperar o username aqui :D
    final profile = await fetchProfile.execute(userName: "laisKagawa");
    print(profile);
    emit(state.copyWith(profile: profile));
  }
}

class ProfileCubitProvider extends BlocProvider<ProfileCubit> {
  ProfileCubitProvider({super.key, Widget? child})
      : super(
          create: (context) => ProfileCubit(
            ProfileCubitState(profile: null),
            fetchProfile: RemoteFetchProfile(),
          )..fetch(),
          child: child,
        );

  static ProfileCubit of(BuildContext context) => BlocProvider.of(context);
}
