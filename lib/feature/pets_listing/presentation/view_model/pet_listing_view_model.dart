import 'package:adoptapet/feature/pets_listing/data/data_source/pet_listing_data_source.dart';
import 'package:adoptapet/feature/pets_listing/domain/usecase/pet_listing_usecase.dart';
import 'package:adoptapet/feature/pets_listing/presentation/state/pet_listing_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../navigator/pet_listing_navigator.dart';

final petListingViewModelProvider = StateNotifierProvider<PetListingViewModel,PetListingState>((ref){
  final navigator = ref.read(petListingViewNavigatorProvider);
  final petListingUseCase = ref.read(petListingUseCaseProvider);
  return PetListingViewModel(navigator,petListingUseCase);
});


class PetListingViewModel extends StateNotifier<PetListingState>{
  final PetListingUseCase petListingUseCase;
  PetListingNavigator navigator;

  PetListingViewModel(this.navigator,this.petListingUseCase):super(PetListingState.inital()){
    getPetListings();

  }

  Future resetState() async{
    state = PetListingState.inital();
    getPetListings();
  }

  Future getPetListings() async{
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page+1;
    final petListings = currentState.petListings;
    final hasReachedMax = currentState.hasMaxReached;

      if (!hasReachedMax) {
        // get data from data source
        final result = await petListingUseCase.getPetListings(page);
        result.fold(
              (failure) =>
          state = state.copyWith(hasMaxReached: true, isLoading: false),
              (data) {
            if (data.isEmpty) {
              state = state.copyWith(hasMaxReached: true);
            } else {
              state = state.copyWith(
                petListings: [...petListings, ...data],
                page: page,
                isLoading: false,
              );
            }
          },
        );

    }
  }
  void openPetDetails(String petId) {
    navigator.openPetDetailsView(petId);
  }
}