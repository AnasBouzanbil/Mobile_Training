



import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class Themenotifier extends StateNotifier<ThemeMode> {
  Themenotifier() : super(ThemeMode.light);

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeProvider = StateNotifierProvider<Themenotifier, ThemeMode>((ref) {
  return Themenotifier();
});