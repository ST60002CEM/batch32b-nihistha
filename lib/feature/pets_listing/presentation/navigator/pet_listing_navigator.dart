import 'package:adoptapet/feature/pets_listing/presentation/view/pet_listing_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../../../home/presentation/navigator/home_navigator.dart';
import '../../../pet_details/presentation/navigator/pet_details_navigator.dart';


final petListingViewNavigatorProvider = Provider((ref) => PetListingNavigator());


class PetListingNavigator with ProductViewRoute{}
mixin PetListingViewRoute {
  openPetListingView() {
    NavigateRoute.pushRoute(const PetListingView());
  }
}
