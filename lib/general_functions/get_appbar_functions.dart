import 'package:flutter/material.dart';
import 'package:workout_application/theme/theme_handler.dart';

getGoBackAppBar() {
  final theme = ThemeHandler().getTheme();

  return AppBar(
      toolbarHeight: 40,
      backgroundColor: theme.appbar!.background,
      title: Text(
        "Go Back",
        style: theme.text!.body,
      ));
}
