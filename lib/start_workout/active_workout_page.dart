import 'package:flutter/material.dart';
import 'package:workout_application/start_workout/workout_exercise_form.dart';
import 'package:workout_application/theme/app_themes.dart';

import '../models/workout.dart';

class ActiveWorkoutPage extends StatelessWidget {
  const ActiveWorkoutPage({required this.workout, Key? key}) : super(key: key);

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
            backgroundColor: theme.colorScheme.background,
            title: Text(workout.title, style: theme.textTheme.subtitle1),
            centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              WorkoutExerciseForm(
                exercises: workout.exercises.exercises,
              ),
            ],
          ),
        ));
  }
}
