class AuthState {
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  AuthState({
    required this.isLoading,
    this.error,
    required this.isAuthenticated,
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
      isAuthenticated: false,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated
    );
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error, isAuthenticated:$isAuthenticated)';
}
