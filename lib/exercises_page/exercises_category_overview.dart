import 'package:flutter/material.dart';
import 'package:workout_application/general-components/app_button.dart';

import '../app_configs.dart';
import '../general_functions/onTapFunctions.dart';
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
    List<AppButton> column1 = [];
    List<AppButton> column2 = [];

    int index = 0;
    for (Exercise exercise in exercises) {
      if (index == 0) {
        column1.add(AppButton(
           buttonText: exercise.title, onPressed: exerciseAppButtonOnTap(context, exercise)));
        index++;
      } else {
        column2.add(AppButton(
           buttonText: exercise.title, onPressed: exerciseAppButtonOnTap(context, exercise)));
        index = 0;
      }
    }

    var categoryText = Text(
      category,
      style: subTitleStyle,
    );

    var exerciseColumns = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(children: column1),
          flex: 1,
        ),
        Expanded(
          child: Column(
            children: column2,
          ),
          flex: 1,
        )
      ],
    );
    return Column(
      children: [categoryText, exerciseColumns],
    );
  }
}
