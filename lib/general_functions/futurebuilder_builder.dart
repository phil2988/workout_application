import 'package:flutter/cupertino.dart';
import 'package:workout_application/theme/theme_handler.dart';

getFutureBuilderErrorHandling({
  required AsyncSnapshot snapshot,
  required Widget returnWidget,
}) {
  final theme = ThemeHandler().getTheme();
  switch (snapshot.connectionState) {
    case ConnectionState.none:
      return Container(
        padding: const EdgeInsets.only(top: 50),
        child: Text(
          "Error! No Connection!",
          style: theme.text!.subtitle,
        ),
        alignment: Alignment.topCenter,
        color: theme.color!.background,
      );
    case ConnectionState.waiting:
      return Container(
        padding: const EdgeInsets.only(top: 50),
        child: Text(
          "Loading...",
          style: theme.text!.subtitle,
        ),
        alignment: Alignment.topCenter,
        color: theme.color!.background,
      );
    default:
      if (snapshot.hasError) {
        return Center(child: Text("Error: ${snapshot.error}"));
      } else {
        return returnWidget;
      }
  }
}
