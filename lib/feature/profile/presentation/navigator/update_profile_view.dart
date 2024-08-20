import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../view/update_profile_view.dart';

final updateProfileViewProvier = Provider((ref) => UpdateProfileView());

class UpdateProfileView{}

mixin UpdateProfileViewRoute{
  openUpdateProfileView(){
    NavigateRoute.pushRoute(const UpdateProfileScreen());
  }
}