import 'package:adoptapet/feature/application/presentation/navigator/mail_navigator.dart';
import 'package:adoptapet/feature/root/presentation/view/root_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';

final rootNavigationProvider = Provider((ref) => RootNavigator());


class RootNavigator with MailNavigatorViewRoute{}
mixin RootViewRoute{

  openRootView() {
    NavigateRoute.pushRoute(const RootApp());
  }
}