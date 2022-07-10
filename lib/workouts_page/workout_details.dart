import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general_functions/get_appbar_functions.dart';
import 'package:workout_application/models/list_of_exercises.dart';
import 'package:workout_application/theme/app_themes.dart';

import '../general-components/app_card.dart';
import '../general_functions/on_tap_functions.dart';

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails(this.title, this.description, this.exercises, {Key? key})
      : super(key: key);

  final String title;
  final String description;
  final ExercisesList exercises;

  @override
  Widget build(BuildContext context) {
    List<AppCard> exerciseCards = [];
    for (var item in exercises.exercises) {
      exerciseCards.add(AppCard(
          title: item.title,
          description: item.description,
          onPressed: exerciseAppButtonOnTap(context, item)));
    }

    final theme = ThemeHandler().getTheme();
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: getGoBackAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: defaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.headline1,
                      textAlign: TextAlign.left,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        description,
                        style: theme.textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      "Exercises in this workout:",
                      style: theme.textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              ...exerciseCards
            ],
          ),
        ));
  }
}
