import 'package:flutter/material.dart';
import 'package:workout_application/exercises-page/exercise_button.dart';

import '../app_configs.dart';
import '../models/exercise_data_models.dart';
import 'exercise-info-page.dart';

class ExercisesOverviewCategory extends StatelessWidget {
  final String category;
  final List<ExerciseModel> exercises;

  const ExercisesOverviewCategory(this.category, this.exercises, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: getChildren(context),
    ));
  }

  void onClick() {}

  List<Widget> getChildren(context) {
    List<Widget> children = [];
    List<ExerciseButton> column1 = [];
    List<ExerciseButton> column2 = [];

    children.add(Text(
      category,
      style: subTitleStyle,
    ));

    int index = 0;
    for (ExerciseModel exercise in exercises) {
      if (index == 0) {
        column1.add(ExerciseButton(
            exercise.name,
            () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExerciseInfo(exercise.name,
                              exercise.description, exercise.images)))
                }));
        index++;
      } else {
        column2.add(ExerciseButton(
            exercise.name,
            () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExerciseInfo(exercise.name,
                              exercise.description, exercise.images)))
                }));
        index = 0;
      }
    }
    children.add(Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: column1),
        Column(
          children: column2,
        )
      ],
    ));
    return children;
  }
}
