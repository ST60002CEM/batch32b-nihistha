import 'package:adoptapet/feature/root/presentation/view/root_view.dart';

import '../../../../app/navigator/navigator.dart';

class RootNavigator{}
mixin RootViewRoute{

  openRootView() {
    NavigateRoute.pushRoute(const RootApp());
  }
}