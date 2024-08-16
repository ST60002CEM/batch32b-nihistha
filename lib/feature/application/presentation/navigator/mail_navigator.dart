import 'package:adoptapet/feature/application/presentation/view/mail_view.dart';

import '../../../../app/navigator/navigator.dart';

class MailNavigator{}
mixin MailNavigatorViewRoute{
  void openMailNavigatorView(){
    NavigateRoute.pushRoute(MailView());
  }
}