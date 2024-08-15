import 'package:adoptapet/feature/application/presentation/navigator/application_navigator.dart';
import 'package:adoptapet/feature/auth/presentation/navigator/register_navigator.dart';
import 'package:adoptapet/feature/home/presentation/view/home_view.dart';
import 'package:adoptapet/feature/root/presentation/navigator/root_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../../../home/presentation/navigator/home_navigator.dart';
import '../view/login_view.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with RegisterViewRoute,RootViewRoute {}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.popAndPushRoute(const LoginView());
  }
  openHomeView(){
    NavigateRoute.popAndPushRoute(const HomeView());
  }
}

