import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/data/usecases/remote_requests_events.dart';
import 'package:sport_connection/domain/usecases/requests_events.dart';
import 'package:sport_connection/presentation/blocs/events/events_cubit_state.dart';

class EventsCubit extends Cubit<EventsCubitState> {
  EventsCubit(
    super.initialState, {
    required this.requestEvents,
  });

  RequestEvents requestEvents;

  Future<void> fetch() async {
    final eventList = await requestEvents.list();
    emit(state.copyWith(eventList: eventList));
  }

  Future<void> delete(int id) async {
    await requestEvents.delete(id);
    await fetch();
  }
}

class EventCubitProvider extends BlocProvider<EventsCubit> {
  EventCubitProvider({super.key, Widget? child})
      : super(
          create: (context) => EventsCubit(
            EventsCubitState(eventList: []),
            requestEvents: RemoteRequestsEvents(),
          )..fetch(),
          child: child,
        );

  static EventsCubit of (BuildContext context) => BlocProvider.of(context);
}
