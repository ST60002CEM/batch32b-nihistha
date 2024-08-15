import 'package:adoptapet/feature/home/presentation/view/home.dart';
import 'package:adoptapet/feature/pets_listing/presentation/navigator/pet_listing_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../view/home_view.dart';

final homeViewNavigatorProvider = Provider((ref) => HomeNavigator());

class HomeNavigator with PetListingViewRoute{}

mixin HomeViewRoute {
  openHomeView() {
    NavigateRoute.pushRoute(const Home());
  }
}