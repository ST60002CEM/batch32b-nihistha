import 'package:adoptapet/screen/dashboard_screen.dart';
import 'package:adoptapet/screen/login_screen.dart';
import 'package:flutter/material.dart';

import '../screen/register_screen.dart';
import '../screen/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
