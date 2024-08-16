import 'package:adoptapet/app/navigator/navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view/meet_view.dart';

final meetNavigatorProvider = Provider((ref) => MeetNavigator());


class MeetNavigator{}
mixin MeetViewRoute{
  openMeetView(String? petId){
    NavigateRoute.pushRoute(ScheduleMeetScreen(petId:petId));
  }
}