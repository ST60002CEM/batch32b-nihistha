import 'package:adoptapet/feature/application/presentation/navigator/application_navigator.dart';
import 'package:adoptapet/feature/auth/presentation/navigator/register_navigator.dart';
import 'package:adoptapet/feature/home/presentation/view/home_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../view/login_view.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with RegisterViewRoute,UserApplicationViewRoute {}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.popAndPushRoute(const LoginView());
  }
  openHomeView(){
    NavigateRoute.popAndPushRoute(const HomeView());
  }
}

