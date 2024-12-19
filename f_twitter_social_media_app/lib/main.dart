// ignore_for_file: deprecated_member_use

import 'package:f_twitter_social_media_app/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FwitterApp());
}

class FwitterApp extends StatelessWidget {
  const FwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fwitter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Custom font
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.blue),
          bodyText1: TextStyle(fontSize: 16.0, color: Colors.grey),
        ),
      ),
      home: const SplashScreen(), // Start with the Splash Screen
    );
  }
}
