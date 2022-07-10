import 'package:workout_application/models/exercise.dart';

class ExercisesList {
  const ExercisesList({this.exercises = const []});

  final List<Exercise> exercises;

  factory ExercisesList.fromJson(List<dynamic> parsedJson) {
    List<Exercise> exercises =
        parsedJson.map((i) => Exercise.fromJson(i)).toList();

    return ExercisesList(exercises: exercises);
  }
}
