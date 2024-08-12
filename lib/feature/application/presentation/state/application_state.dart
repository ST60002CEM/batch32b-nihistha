import 'package:adoptapet/app/app.dart';

import '../../domain/entity/application_entity.dart';

class ApplicationState {
  final bool isLoading;
  final String? error;
  final List<ApplicationEntity> userapplication;

  ApplicationState({
    required this.isLoading,
    this.error,
    required this.userapplication
  });

  factory ApplicationState.initial() {
    return ApplicationState(
      isLoading: false,
      error: null,
      userapplication: []
    );
  }

  ApplicationState copyWith({
    bool? isLoading,
    String? error,
    List<ApplicationEntity>? userapplication,
  }) {
    return ApplicationState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      userapplication: userapplication ?? this.userapplication,
    );
  }
}