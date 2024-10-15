import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('ar');
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;

  Locale get locale => _locale;
  double get screenWidth => _screenWidth;
  double get screenHeight => _screenHeight;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
  void setScreenSize(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    // notifyListeners(); // Notify listeners to rebuild widgets using this provider
  }
}
