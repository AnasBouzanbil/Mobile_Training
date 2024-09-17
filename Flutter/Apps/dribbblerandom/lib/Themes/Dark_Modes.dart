import 'package:flutter/material.dart';
ThemeData DarkMode = ThemeData(
    colorScheme: ColorScheme.dark(
        primary: Colors.grey.shade600,
        onPrimary: Colors.grey.shade200,
        secondary: Colors.grey.shade800,
        surface: Colors.grey.shade900, // Update from 'background' to 'surface'
        inversePrimary: Colors.grey.shade300
    )
);
