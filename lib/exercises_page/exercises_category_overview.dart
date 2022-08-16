import 'package:flutter/material.dart';
import 'package:workout_application/general-components/app_button.dart';
import 'package:workout_application/general-components/subtitle_text.dart';
import 'package:workout_application/theme/theme_handler.dart';

import '../general_functions/on_tap_functions.dart';
import '../models/exercise.dart';

class ExercisesCategoryOverview extends StatelessWidget {
  final String category;
  final List<Exercise> exercises;

  const ExercisesCategoryOverview({
    Key? key,
    required this.category,
    required this.exercises,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getChildren(context);
  }

  Widget getChildren(BuildContext context) {
    final theme = ThemeHandler().getTheme();
    List<AppButton> column1 = [];
    List<AppButton> column2 = [];

    int index = 0;
    for (Exercise exercise in exercises) {
      if (index == 0) {
        column1.add(AppButton(
          buttonText: exercise.title,
          onPressed: exerciseAppButtonOnTap(context, exercise),
        ));
        index++;
      } else {
        column2.add(AppButton(
            buttonText: exercise.title,
            onPressed: exerciseAppButtonOnTap(context, exercise)));
        index = 0;
      }
    }

    var exerciseColumns = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: column1),
        Column(
          children: column2,
        ),
      ],
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
            child:
                SubtitleText(text: category, fontStyle: theme.text!.subtitle!),
          ),
        ),
        exerciseColumns
      ],
    );
  }
}
