import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/my_snackbar.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/usecase/profile_usecase.dart';
import '../navigator/profile_navigator.dart';
import '../state/profile_state.dart';

final profileViewModelProvider =
StateNotifierProvider<ProfileViewModel, ProfileState>((ref){
  final navigator = ref.read(profileViewNavigatorProvider);
  final profileUsecase = ref.read(profileUsecaseProvider);
  return ProfileViewModel(profileUsecase,navigator);
}
);

class ProfileViewModel extends StateNotifier<ProfileState>{
  ProfileViewModel(this.profileUsecase,this.navigator) : super(ProfileState.initial());
  final ProfileUsecase profileUsecase;
  final ProfileNavigator navigator;


  Future<void> fetchProfile() async {
    state = state.copyWith(isLoading: true);
    var data = await profileUsecase.getCurrentUser();
    data.fold(
          (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showMySnackBar(message: failure.error, color: Colors.red);
        print("Error: ${failure.error}");
      },
          (profile) {
        state = state.copyWith(isLoading: false, profile: profile, error: null);
        print("Profile loaded: ${profile.fullname}");
        showMySnackBar(
            message: "Profile loaded", color: Colors.green);
      },
    );
  }

  void updateUserProfile(ProfileEntity newProfile) async {
    state = state.copyWith(isLoading: true);
    var data = await profileUsecase.updateUserProfile(newProfile);
    data.fold((failure) {
      state = state.copyWith(
          isLoading: false,
          error: failure.error);
      showMySnackBar(message: failure.error, color: Colors.red);
    }, (data) {
      state = state.copyWith(
          isLoading: false,
          error: null,
          profile: newProfile
      );

      showMySnackBar(
          message: "Profile updated successfully", color: Colors.green);
    });
  }

  void openUserApplications() {
    navigator.openUserApplications();
  }
  void openUpdateProfileView(){
    navigator.openUpdateProfileView();
  }
}