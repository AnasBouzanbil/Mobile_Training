import 'package:dribbblerandom/Themes/Dark_Modes.dart';
import 'package:dribbblerandom/Themes/Light_Modes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themedata => _themeData;

  bool get isDarkMode => _themeData == DarkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = DarkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();  // This is what was missing
  }
}
