import 'package:flutter/material.dart';

class AppTheme {
  AppTheme({this.color, this.text, this.navbar, this.appbar});
  ThemeColor? color;
  ThemeTextStyle? text;
  ThemeNavbarStyle? navbar;
  ThemeAppbarStyle? appbar;
}

class ThemeColor {
  ThemeColor(
      {this.primary,
      this.onPrimary,
      this.background,
      this.onBackground,
      this.secondary,
      this.onSecondary,
      this.error});

  Color? primary;
  Color? onPrimary;
  Color? secondary;
  Color? onSecondary;
  Color? background;
  Color? onBackground;
  Color? error;
}

class ThemeTextStyle {
  ThemeTextStyle({
    this.title,
    this.titleAlt,
    this.titleError,
    this.subtitle,
    this.subtitleAlt,
    this.subtitleError,
    this.subsubtitle,
    this.subsubtitleAlt,
    this.subsubtitleError,
    this.body,
    this.bodyAlt,
    this.bodyError,
    this.button,
    this.buttonAlt,
    this.buttonError,
  });

  TextStyle? title;
  TextStyle? titleError;
  TextStyle? titleAlt;
  TextStyle? subtitle;
  TextStyle? subtitleError;
  TextStyle? subtitleAlt;
  TextStyle? subsubtitle;
  TextStyle? subsubtitleError;
  TextStyle? subsubtitleAlt;
  TextStyle? body;
  TextStyle? bodyError;
  TextStyle? bodyAlt;
  TextStyle? button;
  TextStyle? buttonError;
  TextStyle? buttonAlt;
}

class ThemeNavbarStyle {
  ThemeNavbarStyle(
      {this.background,
      this.height,
      this.selectedIcon,
      this.unselectedIcon,
      this.selectedText,
      this.unselectedText});

  double? height;
  Color? background;
  TextStyle? selectedText;
  TextStyle? unselectedText;
  IconThemeData? selectedIcon;
  IconThemeData? unselectedIcon;
}

class ThemeAppbarStyle {
  ThemeAppbarStyle({this.background, this.textStyle});

  Color? background;
  TextStyle? textStyle;
}
