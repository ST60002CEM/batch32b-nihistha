import 'package:adoptapet/feature/application/presentation/view/mail_view.dart';
import 'package:adoptapet/feature/meet/presentation/navigator/meet_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';

final mailNavigatorProvider = Provider((ref) => MailNavigator());


class MailNavigator with MeetViewRoute{}
mixin MailNavigatorViewRoute{
  void openMailNavigatorView(){
    NavigateRoute.pushRoute(MailView());
  }
}