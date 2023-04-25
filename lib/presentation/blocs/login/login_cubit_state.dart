class LoginCubitState {
  LoginCubitState({required this.isLoading, required this.isAuthenticated, this.errorMessage = ''});

  final bool isLoading;
  final bool isAuthenticated;
  final String errorMessage;

  LoginCubitState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? errorMessage
  }) =>
      LoginCubitState(
        isLoading: isLoading ?? this.isLoading,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
          errorMessage: errorMessage ?? this.errorMessage,
      );
}
