class EventSaveCubitState {
  EventSaveCubitState(
      {
        this.isLoading = false,
      this.isSaved = false,
      this.errorMessage = '',
      this.formIsPaid = false,
      this.formEventType = 'FUN',
      this.formFrequency = 'ONE_TIME'});

  final bool isLoading;
  final bool isSaved;
  final String errorMessage;
  final bool formIsPaid;
  final String formFrequency;
  final String formEventType;

  EventSaveCubitState copyWith({
    bool? isLoading,
    bool? isSaved,
    String? errorMessage,
    bool? formIsPaid,
    String? formFrequency,
    String? formEventType,
  }) =>
      EventSaveCubitState(
        isLoading: isLoading ?? this.isLoading,
        isSaved: isSaved ?? this.isSaved,
        errorMessage: errorMessage ?? this.errorMessage,
        formEventType: formEventType ?? this.formEventType,
        formFrequency: formFrequency ?? this.formFrequency,
        formIsPaid: formIsPaid ?? this.formIsPaid,
      );
}
