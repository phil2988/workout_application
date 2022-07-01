import 'package:flutter/material.dart';

// Global
const Color primary = Color(0xFF73D493);
const Color background = Color(0xFF232922);

// AppNavBar
const Color navBarSelected = Color.fromARGB(255, 0, 0, 0);
const Color navBarUnSelected = Color.fromARGB(255, 255, 255, 255);

// TextStyles
const TextStyle buttonStyle = TextStyle(fontSize: 18, color: Colors.white);
const TextStyle titleStyle =
    TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle subTitleStyle = TextStyle(fontSize: 30, color: Colors.white);
const TextStyle subTitleStyleError = TextStyle(fontSize: 30, color: Colors.red);
const TextStyle contentStyle = TextStyle(fontSize: 20, color: Colors.white);
const TextStyle accordionContentStyle =
    TextStyle(fontSize: 20, color: Colors.black);

const TextStyle inputNumberStyle = TextStyle(
  color: Colors.white,
  fontSize: 25,
);

const TextStyle kgTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 25,
);

// Paddings
const defaultPadding = EdgeInsets.all(10);
const buttonPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 5);
const titlePadding = EdgeInsets.fromLTRB(0, 20, 0, 10);

// External links
const String apiUrl = "https://workout-application-backend.herokuapp.com/api/";
const String storrageAccountUrl =
    "https://workoutstorage.blob.core.windows.net/";
