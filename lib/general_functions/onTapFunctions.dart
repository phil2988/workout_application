import 'package:flutter/material.dart';

import '../exercises_page/exercise_details.dart';
import '../models/exercise.dart';
import '../models/workout.dart';
<<<<<<< HEAD
import '../workouts_page/workout_details.dart';

void Function() workoutCardOnTap(BuildContext context, Workout workout) {
=======
import '../start_workout/active_workout_page.dart';
import '../workouts_page/workout_details.dart';

VoidCallback workoutCardOnTap(BuildContext context, Workout workout) {
>>>>>>> ff503766e441318c618c3fb92ee18827137bffa5
  return () => Navigator.push<void>(
      context,
      MaterialPageRoute(
          builder: (context) => WorkoutDetails(
              workout.title, workout.description, workout.exercises)));
}

<<<<<<< HEAD
void Function() exerciseAppButtonOnTap(
    BuildContext context, Exercise exercise) {
=======
VoidCallback exerciseAppButtonOnTap(BuildContext context, Exercise exercise) {
>>>>>>> ff503766e441318c618c3fb92ee18827137bffa5
  return () => Navigator.push<void>(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ExerciseDetails(exercise.title, exercise.description, "")));
}
<<<<<<< HEAD
=======

VoidCallback startWorkoutOnTap(BuildContext context, Workout workout) {
  return () => Navigator.push<void>(
      context,
      MaterialPageRoute(
          builder: (context) => ActiveWorkoutPage(workout: workout)));
}
>>>>>>> ff503766e441318c618c3fb92ee18827137bffa5
