import 'package:adoptapet/feature/auth/presentation/view/login_view.dart';
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
      home: const SplashView(),
    );
  }
}
