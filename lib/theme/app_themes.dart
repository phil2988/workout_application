import 'package:flutter/material.dart';

class ThemeHandler with ChangeNotifier {
  final defaultTheme = ThemeData(
      fontFamily: "Staatliches",
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        subtitle1: TextStyle(fontSize: 30, color: Colors.white),
        subtitle2: TextStyle(fontSize: 30, color: Colors.red),
        bodyText1: TextStyle(fontSize: 20, color: Colors.white),
        bodyText2: TextStyle(fontSize: 20, color: Colors.black),
        headline6: TextStyle(fontSize: 25, color: Colors.white),
        button: TextStyle(fontSize: 18, color: Colors.white),
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
