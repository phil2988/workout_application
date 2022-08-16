import 'package:flutter/material.dart';
import 'package:workout_application/theme/app_theme.dart';

class ThemeHandler with ChangeNotifier {
  final defaultTheme = AppTheme(
    color: ThemeColor(
        primary: const Color(0xFF2D3743),
        secondary: const Color(0xFF333E4B),
        onPrimary: Colors.white,
        error: Colors.red,
        background: const Color(0xFF262E39),
        onBackground: Colors.white),
    text: ThemeTextStyle(
        title: const TextStyle(
            fontSize: 40, color: Colors.white, fontFamily: "Staatliches"),
        subtitle: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: "Staatliches",
            height: 1),
        subtitleError: const TextStyle(
            fontSize: 30, color: Colors.red, fontFamily: "Staatliches"),
        subsubtitle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        subsubtitleError: const TextStyle(
            color: Colors.red, fontSize: 25, fontFamily: "Staatliches"),
        body: const TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
        bodyAlt: const TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.w300),
        button: const TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.w300)),
    navbar: ThemeNavbarStyle(
        height: 65,
        background: const Color(0xFF2D3743),
        selectedIcon: const IconThemeData(size: 25, color: Colors.white),
        unselectedIcon: const IconThemeData(size: 20, color: Colors.white),
        selectedText: const TextStyle(color: Colors.white, fontSize: 15),
        unselectedText: const TextStyle(color: Colors.white, fontSize: 13)),
    appbar: ThemeAppbarStyle(
        background: const Color(0xFF2D3743),
        textStyle: const TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
  );

  late AppTheme _themeData;
  AppTheme getTheme() => _themeData;

  ThemeHandler() {
    _themeData = defaultTheme;
    notifyListeners();
  }

  void setTheme(AppTheme theme) {
    _themeData = theme;
    notifyListeners();
  }
}
