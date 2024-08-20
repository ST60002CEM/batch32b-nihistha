import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../../../application/presentation/navigator/update_application_navigator.dart';
import '../view/user_application_detail_view.dart';

final userApplicaitionNavigationProvider = Provider((ref) => UserApplicationNavigator());

class UserApplicationNavigator with UpdateApplicationViewRoute{}

mixin UserApplicationViewRoute{
  void openUserApplications(){
    NavigateRoute.pushRoute(UserApplicationDetailView());
  }
}