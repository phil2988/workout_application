import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general-components/app_button.dart';
import 'package:workout_application/models/exercise.dart';
import 'package:workout_application/start_workout/small-number-input.dart';

class WorkoutExerciseForm extends StatelessWidget {
  const WorkoutExerciseForm(
      {required this.exercise, required this.onSubmit, Key? key})
      : super(key: key);

  final Exercise exercise;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: const [
                SmallNumberInput(text: "Reps"),
                SizedBox(
                  width: 30,
                ),
                SmallNumberInput(
                  text: "Weight",
                  suffix: "Kg",
                )
              ],
            ),
            const SizedBox(width: 30),
          ],
        ),
        Padding(
            padding: defaultPadding,
            child: AppButton(
              "Finish Exercise",
              onSubmit,
              buttonHeight: 50,
              buttonWidth: 180,
            ))
      ],
    );
  }
}
