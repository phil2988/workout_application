import 'package:flutter/material.dart';

final defaultTheme = ThemeData(
    fontFamily: "Staatliches",
    textTheme: defaultTextTheme,
    primaryColor: const Color(0xFF73D493),
    backgroundColor: const Color(0xFF232922),
    bottomNavigationBarTheme: defaultBottomNavigationBarTheme,
    iconTheme: const IconThemeData(color: Colors.black, size: 25),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF232922),
        titleTextStyle: TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)));

const defaultTextTheme = TextTheme(
  headline1:
      TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
  subtitle1: TextStyle(fontSize: 30, color: Colors.white),
  subtitle2: TextStyle(fontSize: 30, color: Colors.red),
  bodyText1: TextStyle(fontSize: 20, color: Colors.white),
  bodyText2: TextStyle(fontSize: 20, color: Colors.black),
  headline6: TextStyle(fontSize: 25, color: Colors.white),
  button: TextStyle(fontSize: 18, color: Colors.white),
);

const defaultBottomNavigationBarTheme = BottomNavigationBarThemeData(
    elevation: 65,
    backgroundColor: Color(0xFF73D493),
    selectedIconTheme:
        IconThemeData(size: 30, color: Color.fromARGB(255, 0, 0, 0)),
    unselectedIconTheme:
        IconThemeData(size: 20, color: Color.fromARGB(255, 255, 255, 255)));
