import 'package:flutter/material.dart';

import '../exercises_page/exercise_details.dart';
import '../models/exercise.dart';
import '../models/workout.dart';
import '../workouts_page/workout_details.dart';

void Function() workoutCardOnTap(BuildContext context, Workout workout) {
  return () => Navigator.push<void>(
      context,
      MaterialPageRoute(
          builder: (context) => WorkoutDetails(
              workout.title, workout.description, workout.exercises)));
}

void Function() exerciseAppButtonOnTap(
    BuildContext context, Exercise exercise) {
  return () => Navigator.push<void>(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ExerciseDetails(exercise.name, exercise.description, "")));
}
