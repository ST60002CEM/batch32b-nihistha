import 'package:adoptapet/feature/pets_listing/domain/entity/pets_listing_entity.dart';

import '../../data/model/pet_listing_model.dart';

class PetListingState{
  final List<PetsListingEntity> petListings;
  final bool isLoading;
  final bool hasMaxReached;
  final int page;

  const PetListingState({
    required this.petListings,
    required this.isLoading,
    required this.hasMaxReached,
    required this.page,
});
  factory PetListingState.inital(){
    return const PetListingState(
        petListings: [],
        isLoading: false,
        hasMaxReached: false,
        page: 0);
  }
  PetListingState copyWith({
    List<PetsListingEntity>? petListings,
    bool? isLoading,
    bool? hasMaxReached,
    int? page,
}){
    return PetListingState(
        petListings: petListings ?? this.petListings,
        isLoading: isLoading ?? this.isLoading,
        hasMaxReached: hasMaxReached ?? this.hasMaxReached,
        page: page ?? this.page,
    );
  }
}