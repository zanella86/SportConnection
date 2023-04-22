import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/bloc/events/events_cubit.dart';
import 'package:sport_connection/bloc/events/events_cubit_state.dart';
import 'package:sport_connection/ui/home/home_screen.dart';

class HomeContainer extends BlocBuilder<EventsCubit, EventsCubitState> {
  HomeContainer({super.key}) : super(
    builder: (context, state) {
      return HomeScreen(
        eventList: state.eventList,
      );
    }
  );
}