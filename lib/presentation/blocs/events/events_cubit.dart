import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/data/usecases/remote_fetch_events.dart';
import 'package:sport_connection/domain/usecases/fetch_events.dart';
import 'package:sport_connection/presentation/blocs/events/events_cubit_state.dart';

class EventsCubit extends Cubit<EventsCubitState> {
  EventsCubit(
    super.initialState, {
    required this.fetchEvents,
  });

  FetchEvents fetchEvents;

  Future<void> fetch() async {
    final eventList = await fetchEvents.execute();
    emit(state.copyWith(eventList: eventList));
  }
}

class EventCubitProvider extends BlocProvider<EventsCubit> {
  EventCubitProvider({super.key, Widget? child})
      : super(
          create: (context) => EventsCubit(
            EventsCubitState(eventList: []),
            fetchEvents: RemoteFetchEvents(),
          )..fetch(),
          child: child,
        );

  static EventsCubit of (BuildContext context) => BlocProvider.of(context);
}
