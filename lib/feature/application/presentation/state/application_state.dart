import 'package:adoptapet/app/app.dart';

import '../../../pet_details/domain/entity/pet_details_entity.dart';
import '../../domain/entity/application_entity.dart';

class ApplicationState {
  final bool isLoading;
  final String? error;
  final List<ApplicationEntity> userapplication;
  final List<PetDetailsEntity>? petDetails;

  ApplicationState({
    required this.isLoading,
    this.error,
    required this.userapplication,
    this.petDetails
  });

  factory ApplicationState.initial() {
    return ApplicationState(
      isLoading: false,
      error: null,
      userapplication: [],
      petDetails: []
    );
  }

  ApplicationState copyWith({
    bool? isLoading,
    String? error,
    List<ApplicationEntity>? userapplication,
    List<PetDetailsEntity>? petDetails
  }) {
    return ApplicationState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      userapplication: userapplication ?? this.userapplication,
      petDetails: petDetails ?? this.petDetails,
    );
  }
}