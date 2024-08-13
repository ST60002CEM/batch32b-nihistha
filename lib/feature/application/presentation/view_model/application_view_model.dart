import 'package:adoptapet/feature/application/domain/usecases/application_usecase.dart';
import 'package:adoptapet/feature/application/presentation/state/application_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../../../../core/common/my_snackbar.dart';
import '../../domain/entity/application_entity.dart';
import '../navigator/application_navigator.dart';

final applicationViewModelProvider = StateNotifierProvider<ApplicationViewModel,ApplicationState>((ref){
  final navigator = ref.read(applicationNavigatorProvider);
  final applicationUsecase = ref.read(applicationUseCaseProvider);
  return ApplicationViewModel(applicationUsecase,navigator);
});

class ApplicationViewModel extends StateNotifier<ApplicationState>{
  final ApplicationUseCase applicationUseCase;
  ApplicationNavigator navigator;
  ApplicationViewModel( this.applicationUseCase,this.navigator): super(ApplicationState.initial());

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
  void openUpdateApplication(String petId){
    navigator.openUpdateApplicationView(petId);
  }
}