class MeetState {
  final bool isLoading;
  final String? error;


  MeetState({
    required this.isLoading,
    this.error,

  });

  factory MeetState.initial() {
    return MeetState(
      isLoading: false,
      error: null,
    );
  }

  MeetState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
  }) {
    return MeetState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,

    );
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error)';
}
