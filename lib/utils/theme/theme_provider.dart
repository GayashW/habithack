import 'package:flutter/material.dart';
import 'package:habithack/utils/theme/dark_mode.dart';
import 'package:habithack/utils/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //initially lighrmode
  ThemeData _themeData = lightMode;

  ThemeProvider();

  //get current theme
  ThemeData get themeData => _themeData;

  //is dark mode
  bool get isDarkMode => _themeData == darktMode;

  //set the theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darktMode;
    } else {
      themeData = lightMode;
    }
  }
}
