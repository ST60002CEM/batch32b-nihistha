import 'package:adoptapet/feature/pet_details/presentation/navigator/pet_details_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/pet_details_usecase.dart';
import '../state/pet_details_state.dart';


final petDetailsViewModelProvider = StateNotifierProvider<PetDetailsViewModel,PetDetailsState>((ref){
  final navigator = ref.read(petDetailsNavigatorProvider);
  final petDetailsUseCase = ref.read(petDetailsUseCaseProvider);
  return PetDetailsViewModel(navigator,petDetailsUseCase);
});

class PetDetailsViewModel extends StateNotifier<PetDetailsState> {
  PetDetailsViewModel(this.navigator,this.petDetailsUseCase) : super(PetDetailsState.initial());
  final PetDetailsUseCase petDetailsUseCase;
  PetDetailsNavigator navigator;
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
  void openApplicationView(String petId) {
    navigator.openApplicationView(petId);
  }
}