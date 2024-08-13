
import 'package:adoptapet/feature/application/presentation/navigator/update_application_navigator.dart';
import 'package:adoptapet/feature/application/presentation/view/application_view.dart';
import 'package:adoptapet/feature/application/presentation/view/update_application_view.dart';
import 'package:adoptapet/feature/application/presentation/view/user_application_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';


final applicationNavigatorProvider = Provider((ref) => ApplicationNavigator());



class ApplicationNavigator with UpdateApplicationViewRoute{}

mixin ApplicationViewRoute {
  void openApplicationView(String petId) {
    NavigateRoute.pushRoute(ApplicationView(petId:petId));
  }

}
mixin UserApplicationViewRoute{
  void openUserApplications(){
    NavigateRoute.pushRoute(UserApplicationsView());
  }
}
