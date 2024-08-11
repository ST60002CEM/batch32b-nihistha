
import 'package:adoptapet/feature/application/presentation/view/application_view.dart';

import '../../../../app/navigator/navigator.dart';

class ApplicationNavigator {}

mixin ApplicationViewRoute {
  openApplicationView() {
    NavigateRoute.popAndPushRoute(const ApplicationView());
  }
}