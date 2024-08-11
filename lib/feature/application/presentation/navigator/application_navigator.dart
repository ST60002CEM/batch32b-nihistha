
import 'package:adoptapet/feature/application/presentation/view/application_view.dart';

import '../../../../app/navigator/navigator.dart';

class ApplicationNavigator {}

mixin ApplicationViewRoute {
  void openApplicationView(String petId) {
    NavigateRoute.pushRoute(ApplicationView(petId:petId));
  }
}