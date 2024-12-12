import 'package:f_twitter_social_media_app/app_icons.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create a Fwitter Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(AppIcon.profile),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(AppIcon.adTheRate),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(AppIcon.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardScreen()));
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
