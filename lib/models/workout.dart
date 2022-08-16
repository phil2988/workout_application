import 'package:workout_application/models/list_of_exercises.dart';

import 'exercise.dart';

class Workout {
  Workout({this.title = "", this.description = "", this.exercises = const []});

  final String title;
  final String description;
  final List<Exercise> exercises;

  factory Workout.fromJson(Map<String, dynamic> parsedJson) {
    return (Workout(
        title: parsedJson["title"],
        description: parsedJson["description"],
        exercises: ExercisesList.fromJson(parsedJson["exercises"]).exercises));
  }
}
