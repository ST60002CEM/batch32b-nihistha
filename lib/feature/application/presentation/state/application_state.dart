class ApplicationState {
  final bool isLoading;
  final String? error;

  ApplicationState({
    required this.isLoading,
    this.error,
  });

  factory ApplicationState.initial() {
    return ApplicationState(
      isLoading: false,
      error: null,
    );
  }

  ApplicationState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return ApplicationState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}