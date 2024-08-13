import 'package:adoptapet/feature/application/domain/usecases/application_usecase.dart';
import 'package:adoptapet/feature/application/presentation/state/application_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/my_snackbar.dart';
import '../../domain/entity/application_entity.dart';

final applicationViewModelProvider =
StateNotifierProvider<ApplicationViewModel, ApplicationState>(
      (ref) => ApplicationViewModel(
    ref.read(applicationUseCaseProvider),
  ),
);

class ApplicationViewModel extends StateNotifier<ApplicationState>{
  final ApplicationUseCase applicationUseCase;

  ApplicationViewModel( this.applicationUseCase): super(ApplicationState.initial());

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
}