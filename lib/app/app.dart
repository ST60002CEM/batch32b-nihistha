
import 'package:adoptapet/feature/home/presentation/view/home_view.dart';
import 'package:adoptapet/feature/pets_listing/presentation/view/pet_details_view.dart';
import 'package:adoptapet/feature/pets_listing/presentation/view/pet_listing_view.dart';
import 'package:adoptapet/feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';


import 'navigator_key/navigator_key.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const PetDetailsView(),
    );
  }
}
