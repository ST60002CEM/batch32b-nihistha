import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/profile_usecase.dart';
import '../state/profile_state.dart';

final profileViewModelProvider =
StateNotifierProvider<ProfileViewModel, ProfileState>(
      (ref) => ProfileViewModel(
    ref.read(profileUsecaseProvider),
  ),
);

class ProfileViewModel extends StateNotifier<ProfileState>{
  ProfileViewModel(this.profileUsecase) : super(ProfileState.initial());
  final ProfileUsecase profileUsecase;


  Future<void> fetchProfile() async {
    state = state.copyWith(isLoading: true);
    var data = await profileUsecase.getCurrentUser();
    data.fold(
          (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        print("Error: ${failure.error}");
      },
          (profile) {
        state = state.copyWith(isLoading: false, profile: profile, error: null);
        print("Profile loaded: ${profile.fullname}");
      },
    );
  }
}