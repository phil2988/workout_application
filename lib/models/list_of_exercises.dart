import 'package:workout_application/models/exercise.dart';

class ExercisesList {
  ExercisesList({required this.exercises});

  final List<Exercise> exercises;

  factory ExercisesList.fromJson(List<dynamic> parsedJson) {
    List<Exercise> exercises =
        parsedJson.map((i) => Exercise.fromJson(i)).toList();

    return ExercisesList(exercises: exercises);
  }
}
