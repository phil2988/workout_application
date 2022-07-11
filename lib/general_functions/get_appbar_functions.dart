import 'package:flutter/material.dart';
import 'package:workout_application/theme/app_themes.dart';
import 'package:workout_application/workout_icons.dart' as workout_icons;

getExercisesAppBar(VoidCallback onPopFunction) {
  final theme = ThemeHandler().getTheme();
  return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.1,
            ),
            SizedBox(
              width: constraints.maxWidth * 0.8,
              child: FittedBox(
                fit: BoxFit.contain,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Exercises Overview",
                      style: theme.textTheme.headline1,
                    ),
                  )),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    workout_icons.Workout.startWorkoutIcon,
                    size: 30,
                  ),
                  onPressed: onPopFunction,
                  splashRadius: 18,
                ),
              ),
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

getWorkoutsOverviewAppBar(VoidCallback onPopFunction) {
  final theme = ThemeHandler().getTheme();
    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.1,
            ),
            SizedBox(
              width: constraints.maxWidth * 0.8,
              child: FittedBox(
                fit: BoxFit.contain,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Workouts Overview",
                      style: theme.textTheme.headline1,
                    ),
                  )),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    workout_icons.Workout.startWorkoutIcon,
                    size: 30,
                  ),
                  onPressed: onPopFunction,
                  splashRadius: 18,
                ),
              ),
            )
          ],
        );
      }),
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
