import 'package:flutter/cupertino.dart';
import 'package:workout_application/theme/app_themes.dart';

getFutureBuilderErrorHandling({
  required AsyncSnapshot snapshot,
  required Widget returnWidget,
}) {
  final theme = ThemeHandler().getTheme();
  switch (snapshot.connectionState) {
    case ConnectionState.none:
      return Container(
        child: Text(
          "Error! No Connection!",
          style: theme.textTheme.subtitle1,
        ),
        alignment: Alignment.topCenter,
        color: theme.colorScheme.background,
      );
    case ConnectionState.waiting:
      return Container(
        child: Text(
          "Loading...",
          style: theme.textTheme.subtitle1,
        ),
        alignment: Alignment.topCenter,
        color: theme.colorScheme.background,
      );
    default:
      if (snapshot.hasError) {
        return Center(child: Text("Error: ${snapshot.error}"));
      } else {
        return returnWidget;
      }
  }
}
