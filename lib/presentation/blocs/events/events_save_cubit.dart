
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/data/usecases/remote_requests_events.dart';
import 'package:sport_connection/domain/models/event_dto_model.dart';
import 'package:sport_connection/domain/usecases/requests_events.dart';
import 'package:sport_connection/presentation/blocs/events/events_save_cubit_state.dart';

class EventSaveCubit extends Cubit<EventSaveCubitState> {
  EventSaveCubit(
      super.initialState, {
        required this.requestEvents,
      });

  RequestEvents requestEvents;

  Future<void> save(EventDTOModel dtoModel) async {

    emit(state.copyWith(isLoading: true));
    final response = await requestEvents.save(dtoModel);

    print('retorno do request ${response}');

    if(response != null) {
      emit(state.copyWith(isSaved: true, isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: 'Não foi possível realizar o login'));
    }
  }

  void toggleSwitch() {
    emit(state.copyWith(formIsPaid: !state.formIsPaid));
  }

  void changeFrequency(String value) {
    emit(state.copyWith(formFrequency: value));
  }

  void changeEventType(String value) {
    emit(state.copyWith(formEventType: value));
  }
}

class EventSaveCubitProvider extends BlocProvider<EventSaveCubit> {
  EventSaveCubitProvider({super.key, Widget? child}) :
        super(
        create: (context) => EventSaveCubit(
          EventSaveCubitState(isLoading: false, isSaved: false, errorMessage: ''),
          requestEvents: RemoteRequestsEvents(),
        ),
        child: child,
      );

  static EventSaveCubit of(BuildContext context) => BlocProvider.of(context);
}