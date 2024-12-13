// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:f_twitter_social_media_app/main.dart';

void main() {
  testWidgets('Onboarding screen shows Get Started button', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(FwitterApp());

    // Verify if the Onboarding screen contains the "Get Started" button.
    expect(find.text('Get Started'), findsOneWidget);
  });

  testWidgets('Navigates to Login screen on Get Started button tap', (WidgetTester tester) async {
    await tester.pumpWidget(FwitterApp());

    // Tap the "Get Started" button.
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Verify if the Login screen is displayed.
    expect(find.text('Login to Fwitter'), findsOneWidget);
  });

  testWidgets('Login screen shows Login and Sign Up buttons', (WidgetTester tester) async {
    await tester.pumpWidget(FwitterApp());

    // Navigate to Login screen.
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Verify if Login and Sign Up buttons are present.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
  });

  testWidgets('Navigates to Dashboard screen on Login button tap', (WidgetTester tester) async {
    await tester.pumpWidget(FwitterApp());

    // Navigate to Login screen.
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Tap the Login button.
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify if the Dashboard screen is displayed.
    expect(find.text('Welcome to Fwitter!'), findsOneWidget);
  });
}
