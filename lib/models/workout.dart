import 'package:workout_application/models/list_of_exercises.dart';

class Workout {
  Workout({
    required this.title,
    required this.description,
    required this.exercises
  });

  final String title;
  final String description;
  final ExercisesList exercises;

  factory Workout.fromJson(Map<String, dynamic> parsedJson) {
    return (Workout(
        title: parsedJson["title"],
        description: parsedJson["description"],
        exercises: ExercisesList.fromJson(parsedJson["exercises"])));
  }
}
