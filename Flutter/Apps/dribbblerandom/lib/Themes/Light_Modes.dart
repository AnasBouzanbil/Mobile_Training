import 'package:flutter/material.dart';
ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
        primary: Colors.grey.shade500,
        onPrimary: Colors.grey.shade200,
        secondary: Colors.grey.shade200,
        surface: Colors.grey.shade300, // Update from 'background' to 'surface'
        inversePrimary: Colors.grey.shade900
    )
);
