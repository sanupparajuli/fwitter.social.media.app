// ignore_for_file: deprecated_member_use

import 'package:f_twitter_social_media_app/screens/splashscreen.dart';
import 'package:f_twitter_social_media_app/theme/theme_data.dart';
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
      theme: getApplicationTheme(),
        
      home: const SplashScreen(), // Start with the Splash Screen
    );
  }
}
