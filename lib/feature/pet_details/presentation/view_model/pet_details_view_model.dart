import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/pet_details_usecase.dart';
import '../state/pet_details_state.dart';

final petDetailsViewModelProvider =
StateNotifierProvider<PetDetailsViewModel, PetDetailsState>(
      (ref) => PetDetailsViewModel(
    ref.read(petDetailsUseCaseProvider),
  ),
);

class PetDetailsViewModel extends StateNotifier<PetDetailsState> {
  PetDetailsViewModel(this.petDetailsUseCase) : super(PetDetailsState.initial());
  final PetDetailsUseCase petDetailsUseCase;
  Future getPetDetails(String petId) async {
    // String productId = '';// get the product Id
    state = state.copyWith(isLoading: true);

    // get data from data source
    final result = await petDetailsUseCase.getPetDetails(petId);
    print('Result: ${result}');
    result.fold(
          (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        print("Error: ${failure.error}");
      },
          (listing) {
        state =
            state.copyWith(isLoading: false, listing: listing, error: null);
        print("listing loaded: ${listing.petName}");
      },
    );

  }
}