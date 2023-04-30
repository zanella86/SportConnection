import 'package:sport_connection/data/entities/event_entity.dart';

class EventSaveCubitState {
  EventSaveCubitState(
      {this.isLoading = false,
      this.isSaved = false,
      this.errorMessage = '',
      this.formIsPaid = false,
      this.formEventType = 'FUN',
      this.formFrequency = 'ONE_TIME',
      this.entity,
      this.isEditing = false});

  final bool isLoading;
  final bool isSaved;
  final String errorMessage;
  final bool formIsPaid;
  final String formFrequency;
  final String formEventType;
  final EventEntity? entity;
  final bool isEditing;

  EventSaveCubitState copyWith({
    bool? isLoading,
    bool? isSaved,
    String? errorMessage,
    bool? formIsPaid,
    String? formFrequency,
    String? formEventType,
    EventEntity? entity,
    bool? isEditing,
  }) =>
      EventSaveCubitState(
        isLoading: isLoading ?? this.isLoading,
        isSaved: isSaved ?? this.isSaved,
        errorMessage: errorMessage ?? this.errorMessage,
        formEventType: formEventType ?? this.formEventType,
        formFrequency: formFrequency ?? this.formFrequency,
        formIsPaid: formIsPaid ?? this.formIsPaid,
        entity: entity ?? this.entity,
        isEditing: isEditing ?? this.isEditing,
      );
}
