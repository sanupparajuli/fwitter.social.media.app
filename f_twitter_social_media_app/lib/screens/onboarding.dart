import 'package:flutter/material.dart';

import '../app_icons.dart';
import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _onboardingPages = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(AppIcon.messageFab, size: 100),
        const SizedBox(height: 20),
        // Welcome Text in a White Container
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white, // White background
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              children: [
                Text(
                  'Welcome to Fwitter',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Connect with friends and explore your network with ease.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(AppIcon.home, size: 100),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white, // White background
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              children: [
                Text(
                  'Stay Connected',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Get real-time updates and notifications from your circle.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(AppIcon.search, size: 100),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white, // White background
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              children: [
                Text(
                  'Discover More',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Explore trending topics and connect with new people.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ];

  void _nextPage() {
    if (_currentPage < _onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/background.jpg"), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              // Logo at the top
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Center(
                  child: Image.asset(
                    "assets/images/fwitter_logo.jpg", // Logo image
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: _onboardingPages,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: _previousPage,
                      child: Text(
                        'Previous',
                        style: TextStyle(
                          color: _currentPage > 0 ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
                    if (_currentPage == _onboardingPages.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                          );
                        },
                        child: const Text('Get Started'),
                      )
                    else
                      TextButton(
                        onPressed: _nextPage,
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
