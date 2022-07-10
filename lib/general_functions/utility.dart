import '../app_configs.dart';
import '../models/exercise.dart';

String getImageUrl({String exerciseUrl = ""}) {
  return storrageAccountUrl +
      "images/" +
      (exerciseUrl == "" ? "big-guns.jpg" : exerciseUrl);
}

List<String> getUniqueCategoriesWithExercises(List<Exercise> exercises) {
  List<String> uniques = [];

  for (var exercise in exercises) {
    if (!uniques.contains(exercise.category)) {
      uniques.add(exercise.category);
    }
  }

  uniques.sort((a, b) {
    return a.compareTo(b);
  });

  return uniques;
}

List<Exercise> getExercisesWithCategory(
    String category, List<Exercise> models) {
  List<Exercise> exercises = [];

  for (var exercise in models) {
    if (exercise.category == category) {
      exercises.add(exercise);
    }
  }

  return exercises;
}
