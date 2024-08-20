
import 'package:adoptapet/feature/meet/domain/usecase/meet_usecase.dart';
import 'package:adoptapet/feature/meet/presentation/state/meet_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/my_snackbar.dart';
import '../../domain/entity/meet_entity.dart';

final meetViewModelProvider = StateNotifierProvider<MeetViewModel, MeetState>((ref) {
  return MeetViewModel(
    ref.read(meetUsevaseProvider),
  );
});

class MeetViewModel extends StateNotifier<MeetState>{
  final MeetUsecase meetUseCase;
  MeetViewModel(this.meetUseCase): super(MeetState.initial());
  Future<void> scheduleMeet(MeetEntity meet) async {
    state = state.copyWith(isLoading: true);
    var data = await meetUseCase.scheduleMeet(meet);
    data.fold(
          (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        showMySnackBar(message: failure.error);
      },
          (success) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Successfully registered");
      },
    );
  }
}