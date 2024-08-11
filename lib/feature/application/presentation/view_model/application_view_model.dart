import 'package:adoptapet/feature/application/domain/usecases/application_usecase.dart';
import 'package:adoptapet/feature/application/presentation/state/application_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/my_snackbar.dart';
import '../../domain/entity/application_entity.dart';

class ApplicationViewModel extends StateNotifier<ApplicationState>{
  final ApplicationUseCase applicationUseCase;

  ApplicationViewModel( this.applicationUseCase): super(ApplicationState.initial());

  Future<void> createApplication(ApplicationEntity application) async {
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

}