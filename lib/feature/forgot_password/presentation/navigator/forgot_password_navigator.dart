import 'package:adoptapet/feature/forgot_password/presentation/view/verification_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/navigator/navigator.dart';
import '../../../auth/presentation/navigator/login_navigator.dart';
import '../../../root/presentation/navigator/root_navigator.dart';

final forgotPasswordNavigatorProvider =
Provider((ref) => ForgotPasswordNavigator());

class ForgotPasswordNavigator with RootViewRoute, LoginViewRoute {}

mixin ForgotPasswordRoute {
  openForgotPasswordView() {
    NavigateRoute.popAndPushRoute(const VerificationView());
  }
}
