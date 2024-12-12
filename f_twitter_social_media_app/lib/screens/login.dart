import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'signup.dart';
import '../app_icons.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login to Fwitter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(AppIcon.adTheRate),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(AppIcon.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardScreen()));
              },
              child: Text('Login'),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
                },
                child: Text('Don’t have an account? Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
