import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    background: Color.fromARGB(255, 255, 255, 255),
    secondary: Colors.blueAccent,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.blue),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
  ),
 
  iconTheme: const IconThemeData(color: Colors.blueAccent),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  cardColor: Colors.white,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blueAccent,
    textTheme: ButtonTextTheme.primary,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    background: Color(0xFF121212),
    secondary: Colors.lightBlueAccent,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    surface: Color(0xFF1E1E1E),
    onSurface: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.lightBlueAccent),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  ),

  iconTheme: const IconThemeData(color: Colors.lightBlueAccent),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.lightBlueAccent,
    foregroundColor: Colors.black,
  ),
  cardColor: const Color(0xFF1E1E1E),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.lightBlueAccent,
    textTheme: ButtonTextTheme.primary,
  ),
);
