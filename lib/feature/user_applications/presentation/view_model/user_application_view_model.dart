
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/presentation/navigator/mail_navigator.dart';
import '../../data/model/user_application_model.dart';
import '../../domain/entity/user_application_entity.dart';
import '../../domain/usecase/user_application_usecase.dart';
import '../navigator/user_application_navigator.dart';
import '../state/user_application_state.dart';

final userApplicationViewModelProvider = StateNotifierProvider<UserApplicationViewModel,UserApplicationState>((ref){
  final userApplicationUsecase = ref.read(userApplicationUseCaseProvider);
  final userApplicationNavigator=ref.read(userApplicaitionNavigationProvider);
  return UserApplicationViewModel(userApplicationUsecase,userApplicationNavigator);
});
class UserApplicationViewModel extends StateNotifier<UserApplicationState>{
  final UserApplicationUseCase userApplicationUseCase;
  final UserApplicationNavigator userApplicationNavigator;
  UserApplicationViewModel(this.userApplicationUseCase,this.userApplicationNavigator):
        super(UserApplicationState.initial());


  Future<void> getUserApplications() async {
    state = state.copyWith(isLoading: true);
    final result = await userApplicationUseCase.getUserApplication();
    result.fold(
          (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error.toString(),
      ),
          (data) {
            final List<UserApplicationEntity> applications = data;
        state = state.copyWith(
          isLoading: false,
          userApplication: applications,
        );
      },
    );
  }
  void openUpdateApplication(String id){
    userApplicationNavigator.openUpdateApplicationView(id);
  }
}
