
import '../../domain/entity/pet_details_entity.dart';

class PetDetailsState {
  final bool isLoading;
  final PetDetailsEntity? listing;
  final String? error;

  PetDetailsState({
    required this.isLoading,
    this.listing,
    this.error,
  });

  factory PetDetailsState.initial() {
    return PetDetailsState(
      isLoading: false,
      error: null,
      listing: null,
    );
  }

  PetDetailsState copyWith({
    bool? isLoading,
    final PetDetailsEntity? listing,
    String? error,
  }) {
    return PetDetailsState(
      isLoading: isLoading ?? this.isLoading,
      listing: listing ?? this.listing,
      error: error ?? this.error,
    );
  }

// @override
// String toString() => 'AuthState(isLoading: $isLoading, error: $error)';
}