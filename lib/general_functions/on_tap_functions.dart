import 'package:flutter/material.dart';
import '../exercises_page/exercise_details.dart';
import '../models/exercise.dart';
import '../models/workout.dart';
import '../start_workout/active_workout_page.dart';
import '../workouts_page/workout_details.dart';

VoidCallback workoutCardOnTap(BuildContext context, Workout workout) {
  return () => Navigator.push<void>(
      context,
      MaterialPageRoute(
          builder: (context) => WorkoutDetails(
              workout.title, workout.description, workout.exercises)));
}

VoidCallback exerciseAppButtonOnTap(BuildContext context, Exercise exercise) {
  return () => Navigator.push<void>(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ExerciseDetails(title: exercise.title, description: exercise.description, imageUrl: "")));
}

VoidCallback startWorkoutOnTap(BuildContext context, Workout workout) {
  return () => Navigator.push<void>(
      context,
      MaterialPageRoute(
          builder: (context) => ActiveWorkoutPage(workout: workout)));
}
