import 'package:adoptapet/feature/profile/presentation/view/profile_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../../../application/presentation/navigator/application_navigator.dart';


final profileViewNavigatorProvider = Provider((ref) => ProfileNavigator());


class ProfileNavigator with UserApplicationViewRoute{}
mixin ProfileViewRoute{
  openProfileView(){
    NavigateRoute.pushRoute(const ProfileUI());
  }
}