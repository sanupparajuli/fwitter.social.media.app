// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'screens/onboarding.dart';

void main() => runApp(FwitterApp());

class FwitterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fwitter',
      home: OnboardingScreen(),
    );
  }
}
