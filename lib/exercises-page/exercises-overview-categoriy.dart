import 'package:flutter/material.dart';
import 'package:workout_application/general-components/button.dart';

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

  List<Widget> getChildren(BuildContext context) {
    List<Widget> children = [];
    List<AppButton> column1 = [];
    List<AppButton> column2 = [];

    children.add(Text(
      category,
      style: subTitleStyle,
    ));

    int index = 0;
    for (ExerciseModel exercise in exercises) {
      if (index == 0) {
        column1.add(
            AppButton(exercise.name, getButtonFunction(context, exercise)));
        index++;
      } else {
        column2.add(
            AppButton(exercise.name, getButtonFunction(context, exercise)));
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

  void Function() getButtonFunction(
      BuildContext context, ExerciseModel exercise) {
    return () => Navigator.push<void>(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const ExerciseInfo("YAAAA", "sdgsdfgsdh", "")));
  }
}
