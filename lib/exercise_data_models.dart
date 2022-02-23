import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ExerciseGroupModel {
  String categoryName;
  List<ExerciseModel> exercises;

  ExerciseGroupModel({required this.categoryName, required this.exercises});

  factory ExerciseGroupModel.fromJson(Map<String, dynamic> parsedJson) {
    var exercisesFromJson = parsedJson["exercises"];

    return (ExerciseGroupModel(
      categoryName: parsedJson["categoryName"],
      exercises: List<ExerciseModel>.from(exercisesFromJson),
    ));
  }
}

@JsonSerializable()
class ExerciseModel {
  String exerciseName;
  String exerciseDescription;
  List<String> gifLocations;

  ExerciseModel(
      {required this.exerciseName,
      required this.exerciseDescription,
      required this.gifLocations});

  factory ExerciseModel.fromJson(Map<String, dynamic> parsedJson) {
    var gifLocationsFromJson = parsedJson["gifLocations"];

    return (ExerciseModel(
      exerciseName: parsedJson["exerciseName"],
      exerciseDescription: parsedJson["exerciseDescription"],
      gifLocations: List<String>.from(gifLocationsFromJson),
    ));
  }
}

// var streetsFromJson = parsedJson['streets'];
// List<String> streetsList = new List<String>.from(streetsFromJson);
