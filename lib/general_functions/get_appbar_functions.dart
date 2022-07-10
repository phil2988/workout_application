import 'package:flutter/material.dart';
import 'package:workout_application/theme/app_themes.dart';
import 'package:workout_application/workout_icons.dart' as workout_icons;

import '../app_configs.dart';

getExercisesAppBar(VoidCallback onPopFunction) {
  final theme = ThemeHandler().getTheme();
  return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: [
            Container(
                alignment: const Alignment(0, 0),
                child: Text(
                  "Exercises Overview",
                  style: theme.textTheme.headline1,
                )),
            Container(
              alignment: const Alignment(1.08, 0),
              child: IconButton(
                  icon: const Icon(
                    workout_icons.Workout.startWorkoutIcon,
                    size: 30,
                  ),
                  onPressed: onPopFunction,
                  splashRadius: 25),
            )
          ],
        );
      }),
      centerTitle: true);
}

getStartWorkoutAppBar() {
  final theme = ThemeHandler().getTheme();
  return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      title: Text("Start Workout", style: theme.textTheme.headline1),
      centerTitle: true);
}

getWorkoutsOverviewAppBar() {
  final theme = ThemeHandler().getTheme();
  return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      title: Text("Workouts Overview", style: theme.textTheme.headline1),
      centerTitle: true);
}

getGoBackAppBar() {
  final theme = ThemeHandler().getTheme();

  return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      title: Text(
        "Go Back",
        style: theme.textTheme.subtitle1,
      ));
}
