import 'package:flutter/material.dart';
import 'package:test_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF6D64FC),
        scaffoldBackgroundColor: Color(0xFF6D64FC),
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
