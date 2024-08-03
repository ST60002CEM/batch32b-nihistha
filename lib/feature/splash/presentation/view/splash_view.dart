import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/splash_view_model.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashVIewState();
}

class _SplashVIewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    ref.read(splashViewModelProvider.notifier).openLoginView();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFAE0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your splash screen content here, such as a logo or animation
            Image.asset('assets/images/logo.png'),
            SizedBox(height: 10.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Adopt',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'apet',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),),
          ],
        ),
      ),
    );
  }
}
