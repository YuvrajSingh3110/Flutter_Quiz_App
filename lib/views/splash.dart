import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/views/home.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'lib/assets/images/login.jpg',
      nextScreen: Home(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
