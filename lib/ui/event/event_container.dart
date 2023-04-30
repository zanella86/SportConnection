import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/presentation/blocs/events/events_save_cubit.dart';
import 'package:sport_connection/presentation/blocs/events/events_save_cubit_state.dart';
import 'package:sport_connection/ui/event/event_screen.dart';


class EventContainer extends BlocBuilder<EventSaveCubit, EventSaveCubitState>{
  EventContainer({super.key}) : super(
      builder: (context, state) {
        return EventScreen();
      }
  );

}