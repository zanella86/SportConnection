
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/data/entities/event_entity.dart';
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

    if(response != null) {
      emit(state.copyWith(isSaved: true, isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: 'Não foi possível salvar o evento'));
    }
  }

  Future<void> update(EventDTOModel dtoModel) async {

    emit(state.copyWith(isLoading: true));
    final response = await requestEvents.update(dtoModel);

    if(response != null) {
      emit(state.copyWith(isSaved: true, isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: 'Não foi possível salvar o evento'));
    }
  }

  void toggleSwitchParam(bool value) {
    if(value != state.formIsPaid) {
      emit(state.copyWith(formIsPaid: value));
    }
  }

  void changeFrequency(String value) {
    if(value != state.formFrequency) {
      emit(state.copyWith(formFrequency: value));
    }
  }

  void changeEventType(String value) {
    if(value != state.formEventType) {
      emit(state.copyWith(formEventType: value));
    }
  }
}

class EventSaveCubitProvider extends BlocProvider<EventSaveCubit> {
  EventSaveCubitProvider({super.key, Widget? child, EventEntity? entity, bool isEditing = false }) :
        super(
        create: (context) => EventSaveCubit(
          EventSaveCubitState(isLoading: false, isSaved: false, errorMessage: '', entity: entity, isEditing: isEditing ),
          requestEvents: RemoteRequestsEvents(),
        ),
        child: child,
      );

  static EventSaveCubit of(BuildContext context) => BlocProvider.of(context);
}