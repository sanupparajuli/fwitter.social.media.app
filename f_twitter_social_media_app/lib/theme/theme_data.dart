import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return  ThemeData(
  // primarySwatch: Colors.orange,
  scaffoldBackgroundColor: Colors.grey,
  fontFamily: 'Roboto-BoldItalic',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle:  const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat Regular',
      ), backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      )
    )
  )
  );
}