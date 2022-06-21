import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_application/start_workout/workout_exercise_form.dart';

import '../app_configs.dart';
import '../models/workout.dart';

class ActiveWorkoutPage extends StatelessWidget {
  final Workout workout;

  ActiveWorkoutPage({required this.workout, Key? key}) : super(key: key);
  int currentExercise = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
            backgroundColor: background,
            title: Text(workout.title, style: subTitleStyle),
            centerTitle: true),
        body: Column(
          children: [
            WorkoutExerciseForm(
                exercises: workout.exercises.exercises,
            ),
          ],
        ));
  }
}
