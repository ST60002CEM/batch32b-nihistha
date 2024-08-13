import 'package:adoptapet/feature/profile/presentation/view/profile_view.dart';

import '../../../../app/navigator/navigator.dart';

class ProfileNavigator{}
mixin ProfileViewRoute{
  openProfileView(){
    NavigateRoute.pushRoute(const ProfileUI());
  }
}