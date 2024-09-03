import 'package:flutter/material.dart';
import 'package:test_app/landing.dart';
import 'package:test_app/onboard/onboard.dart';
import 'package:test_app/splash.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: SplashScreen());
  }
}
