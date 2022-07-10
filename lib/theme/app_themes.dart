import 'package:flutter/material.dart';

class ThemeHandler with ChangeNotifier {
  final defaultTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF73D493),
          onPrimary: Colors.black,
          secondary: Colors.transparent,
          onSecondary: Colors.transparent,
          error: Colors.red,
          onError: Colors.black,
          background: Color(0xFF232922),
          onBackground: Colors.white,
          surface: Color(0xFF73D493),
          onSurface: Colors.white),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Staatliches"),
        subtitle1: TextStyle(
            fontSize: 30, color: Colors.white, fontFamily: "Staatliches"),
        subtitle2: TextStyle(
            fontSize: 30, color: Colors.red, fontFamily: "Staatliches"),
        bodyText1: TextStyle(fontSize: 20, color: Colors.white),
        bodyText2: TextStyle(fontSize: 20, color: Colors.black),
        headline5: TextStyle(
            fontSize: 28, color: Colors.red, fontFamily: "Staatliches"),
        headline6: TextStyle(
            fontSize: 28, color: Colors.white, fontFamily: "Staatliches"),
        headline4: TextStyle(
            color: Colors.white, fontSize: 25, fontFamily: "Staatliches"),
        button: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontFamily: "Staatliches",
            fontWeight: FontWeight.w500),
      ),
      primaryColor: const Color(0xFF73D493),
      backgroundColor: const Color(0xFF232922),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          // Used for bar height
          elevation: 65,
          backgroundColor: Color(0xFF73D493),
          selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 15),
          unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 13),
          selectedIconTheme: IconThemeData(size: 25, color: Colors.white),
          unselectedIconTheme: IconThemeData(size: 20, color: Colors.black)),
      iconTheme: const IconThemeData(color: Colors.black, size: 25),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF232922),
          titleTextStyle: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)));

  late ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  ThemeHandler() {
    _themeData = defaultTheme;
    notifyListeners();
  }

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
