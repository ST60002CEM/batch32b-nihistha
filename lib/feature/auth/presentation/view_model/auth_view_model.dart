import 'package:adoptapet/feature/auth/presentation/navigator/login_navigator.dart';
import 'package:adoptapet/feature/auth/presentation/state/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/my_snackbar.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/usecases/auth_usecases.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
      (ref) => AuthViewModel(
    ref.read(loginViewNavigatorProvider),
    ref.read(authUseCaseProvider),
  ),
);


class AuthViewModel extends StateNotifier<AuthState>{
  AuthViewModel(this.navigator,this.authUseCase): super(AuthState.initial());
  final AuthUseCase authUseCase;
  final LoginViewNavigator navigator;

  Future<void> registerUser(AuthEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.registerUser(user);
    data.fold(
          (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        // showMySnackBar(message: failure.error, color: Colors.red);
      },
          (success) {
        state = state.copyWith(isLoading: false, error: null);
        // showMySnackBar(message: "Successfully registered");

      },
    );
  }

  Future<void> loginUser(
      String email,
      String password,
      ) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.loginUser(email, password);
    data.fold(
          (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        // showMySnackBar(message: failure.error, color: Colors.red);
      },
          (success) {
        state = state.copyWith(isLoading: false, error: null);
        openHomeView();
      },
    );
  }
  void openRegisterView() {
    navigator.openRegisterView();
  }

  void openHomeView() {
    navigator.openHomeView();
  }
}