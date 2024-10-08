import 'package:adoptapet/feature/application/domain/usecases/application_usecase.dart';
import 'package:adoptapet/feature/application/presentation/state/application_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../../../../core/common/my_snackbar.dart';
import '../../../pet_details/domain/usecase/pet_details_usecase.dart';
import '../../domain/entity/application_entity.dart';
import '../navigator/application_navigator.dart';

final applicationViewModelProvider = StateNotifierProvider<ApplicationViewModel,ApplicationState>((ref){
  final navigator = ref.read(applicationNavigatorProvider);
  final applicationUsecase = ref.read(applicationUseCaseProvider);
  final petDetailsUseCase = ref.read(petDetailsUseCaseProvider);
  return ApplicationViewModel(applicationUsecase,navigator,petDetailsUseCase);
});

class ApplicationViewModel extends StateNotifier<ApplicationState>{
  final ApplicationUseCase applicationUseCase;
  ApplicationNavigator navigator;
  final PetDetailsUseCase petDetailsUseCase;
  ApplicationViewModel( this.applicationUseCase,this.navigator,this.petDetailsUseCase): super(ApplicationState.initial());

  Future<void> submitApplication(ApplicationEntity application) async {
    state = state.copyWith(isLoading: true);
    var data = await applicationUseCase.createApplication(application);
    data.fold(
          (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        showMySnackBar(message: failure.error, color: Colors.red);
      },
          (success) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Application Submitted");
      },
    );
  }
  //
  // Future<void> getUserApplicationWithPetDetails() async {
  //   if (state.isLoading) return;
  //   try {
  //     state = state.copyWith(isLoading: true);
  //     final result = await applicationUseCase.getUserApplication();
  //     result.fold(
  //           (failure) {
  //         state = state.copyWith(
  //           isLoading: false,
  //           error: failure.error,
  //         );
  //       },
  //           (applications) async {
  //             state.copyWith(userapplication:applications);
  //           });
  //         final applicationsWithPetDetails = state.userapplication.map((application) {
  //           final petDetails = petDetailsUseCase.getPetDetails(application.petId);
  //           state.copyWith(petDetails : petDetails);
  //           // return application.copyWith(petDetails: petDetails);
  //         });
  //   } catch (e) {
  //     state = state.copyWith(isLoading: false);
  //     // Handle error appropriately
  //   }
  // }



  Future<void> deleteApplication(String id) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);

    final result = await applicationUseCase.deleteApplication(id);
    result.fold(
          (failure) {
        // Show error message if deletion fails
        showMySnackBar(
            message: "Failed to delete product: ${failure.error}",
            color: Colors.red);
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
      },
          (successMessage) {
        // Show success message if deletion is successful
        showMySnackBar(message: "Application deleted successfully");

        // Remove the deleted product from the list
        final updatedProductList = state.userapplication
            .where((application) => application.appid != id)
            .toList();

        state = state.copyWith(
          isLoading: false,
          error: null,
          userapplication: updatedProductList,
        );
      },
    );
  }
  Future<void> updateApplication(ApplicationEntity application) async {
    state = state.copyWith(isLoading: true);
    final result = await applicationUseCase.updateApplication(application);
    result.fold(
          (failure) {
        showMySnackBar(message: failure.error, color: Colors.red);
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
      },
          (data) {
        showMySnackBar(
            message: "Application updated successfully", color: Colors.green);
        state = state.copyWith(
          isLoading: false,
          error: null,
        );

      },
    );
  }
  Future getUserApplication() async{
    if (state.isLoading) return false;
    try {
      state = state.copyWith(isLoading: true);
      final result = await applicationUseCase.getUserApplication();

      return result.fold(
            (failure) {
          state = state.copyWith(
            isLoading: false,
          );
          return false;
        },
            (data) {
          state = state.copyWith(
            userapplication: [...state.userapplication, ...data],
            isLoading: false,
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
  void openUpdateApplication(String id){
    navigator.openUpdateApplicationView(id);
  }
}