import 'package:adoptapet/feature/pets_listing/data/data_source/pet_listing_data_source.dart';
import 'package:adoptapet/feature/pets_listing/domain/usecase/pet_listing_usecase.dart';
import 'package:adoptapet/feature/pets_listing/presentation/state/pet_listing_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoints.dart';
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
    getPetListing();

  }

  Future resetState() async{
    state = PetListingState.inital();
    await getPetListing();
  }

  Future getPetListing({int? page}) async{
    if (state.isLoading) return false;

    try {
      state = state.copyWith(isLoading: true);
      final currentPage = page ?? state.page + 1;
      final result = await petListingUseCase.getPetListings(currentPage);

      return result.fold(
            (failure) {
          state = state.copyWith(
            isLoading: false,
            hasMaxReached: true, // Consider setting hasReachedMax based on actual logic
          );
          return false;
        },
            (data) {
          state = state.copyWith(
            petListings: [...state.petListings, ...data],
            page: currentPage,
            isLoading: false,
            hasMaxReached: data.isEmpty || data.length < ApiEndpoints.limitPage,
          );
          return true;
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      // Handle error appropriately
      return false;
    }
  }

  // Future<void> searchPets({
  //   String? query,
  //   String? breed,
  //   String? gender,
  //   String? size,
  // }) async {
  //   state = state.copyWith(
  //     isLoading: true,
  //     isSearching: true,
  //     searchQuery: query,
  //     searchBreed: breed,
  //     searchGender: gender,
  //     searchSize: size,
  //   );
  //
  //   final result = await _petListingUseCase.searchPetListings(
  //     query: query,
  //     breed: breed,
  //     gender: gender,
  //     size: size,
  //   );
  //
  //   result.fold(
  //         (failure) => state = state.copyWith(isLoading: false, petListings: []),
  //         (pets) => state = state.copyWith(isLoading: false, petListings: pets),
  //   );
  // }

  void openPetDetails(String petId) {
    navigator.openPetDetailsView(petId);
  }
}