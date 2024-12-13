import 'package:f_twitter_social_media_app/app_icons.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fwitter Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(AppIcon.notification),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(AppIcon.messageFab),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to Fwitter!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(AppIcon.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(AppIcon.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(AppIcon.profile), label: 'Profile'),
        ],
      ),
    );
  }
}
