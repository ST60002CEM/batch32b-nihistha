
import 'package:adoptapet/feature/auth/presentation/view/login_view.dart';
import 'package:adoptapet/feature/home/presentation/view/home.dart';
import 'package:adoptapet/feature/pet_details/presentation/view_model/pet_details_view_model.dart';
import 'package:adoptapet/feature/profile/presentation/view/profile_view.dart';
import 'package:adoptapet/feature/profile/presentation/view/user_profile_view.dart';
import 'package:adoptapet/feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';


import '../feature/home/presentation/view/home_view.dart';
import 'navigator_key/navigator_key.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Adoptapet',
      home:  SplashView(),
    );
  }
}