import 'package:adoptapet/feature/profile/presentation/navigator/update_profile_view.dart';
import 'package:adoptapet/feature/profile/presentation/view/profile_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../../../user_applications/presentation/navigator/user_application_navigator.dart';


final profileViewNavigatorProvider = Provider((ref) => ProfileNavigator());


class ProfileNavigator with UserApplicationViewRoute,UpdateProfileViewRoute{}
mixin ProfileViewRoute{
  openProfileView(){
    NavigateRoute.pushRoute(const ProfileUI());
  }
}