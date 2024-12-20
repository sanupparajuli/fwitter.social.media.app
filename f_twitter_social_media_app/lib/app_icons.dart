import 'package:flutter/widgets.dart';

class AppIcon {
  AppIcon._();

  static const _kFontFam = 'TwitterIcon';

  static const IconData bulb = IconData(0xf567, fontFamily: _kFontFam); // Onboarding
  static const IconData adTheRate = IconData(0xf064, fontFamily: _kFontFam); // Login Email
  static const IconData lock = IconData(0xf023, fontFamily: _kFontFam); // Login Password
  static const IconData profile = IconData(0xf056, fontFamily: _kFontFam); // Signup
  static const IconData home = IconData(0xf053, fontFamily: _kFontFam); // Dashboard Home
  static const IconData search = IconData(0xf058, fontFamily: _kFontFam); // Dashboard Search
  static const IconData notification = IconData(0xf055, fontFamily: _kFontFam); // Dashboard Notification
  static const IconData messageFab = IconData(0xf053, fontFamily: _kFontFam); // Dashboard MessageFab

  // New flash icon
  static const IconData flash = IconData(0xf0e7, fontFamily: _kFontFam); // Flash Logo
}
