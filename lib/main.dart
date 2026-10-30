import 'package:flutter/material.dart';
import 'package:weather_app/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          HomeScreen(), // called the HomeScreen function in home screen.dart file.
    );
  }
}
