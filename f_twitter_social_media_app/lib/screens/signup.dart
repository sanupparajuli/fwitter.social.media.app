// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sort_child_properties_last

import 'package:f_twitter_social_media_app/app_icons.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      appBar: AppBar(
        title: Text('Create a Fwitter Account'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Join Fwitter',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: Icon(AppIcon.profile),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(AppIcon.adTheRate),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(AppIcon.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DashboardScreen()));
                  },
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
