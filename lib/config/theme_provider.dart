import 'package:flutter/material.dart';
import 'package:post_hub_app/config/theme.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeMode get currentTheme => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeData get currentThemeData => _isDarkMode ? darkTheme : lightTheme;
}
