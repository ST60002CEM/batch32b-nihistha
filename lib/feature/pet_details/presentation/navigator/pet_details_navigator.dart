import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../view/pet_details_view.dart';

final petDetailsNavigatorProvider =
Provider<PetDetailsNavigator>((ref) => PetDetailsNavigator());

class PetDetailsNavigator {}

mixin ProductViewRoute {
  void openPetDetailsView(String petId) {
    NavigateRoute.pushRoute(PetDetailsView(petId:petId));
  }
}