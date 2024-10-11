import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.orangeAccent,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.orangeAccent,
    secondary: Colors.blueAccent,
    surface: Colors.grey.shade200,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.black,
    onSurface: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.orangeAccent,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black87),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.orangeAccent,
    textTheme: ButtonTextTheme.primary,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.orangeAccent.shade700,
  colorScheme: ColorScheme.dark(
    background: Colors.black12,
    primary: Colors.orangeAccent.shade700,
    secondary: Colors.tealAccent,
    surface: Colors.grey.shade800,
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.orangeAccent.shade700,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.orangeAccent.shade700,
    textTheme: ButtonTextTheme.primary,
  ),
);
