class ExerciseGroupModel {
  String categoryName;
  ExerciseModelList exercises;

  ExerciseGroupModel({required this.categoryName, required this.exercises});

  factory ExerciseGroupModel.fromJson(Map<String, dynamic> parsedJson) {
    final exercisesFromJson = parsedJson["exercises"];

    return (ExerciseGroupModel(
      categoryName: parsedJson["categoryName"],
      exercises: ExerciseModelList.fromJson(exercisesFromJson),
    ));
  }
}

class ExerciseModelList {
  final List<ExerciseModel> exerciseModels;

  ExerciseModelList({required this.exerciseModels});

  factory ExerciseModelList.fromJson(List<dynamic> parsedJson) {
    List<ExerciseModel> exerciseModels = [];
    exerciseModels = parsedJson.map((e) => ExerciseModel.fromJson(e)).toList();
    return ExerciseModelList(exerciseModels: exerciseModels);
  }
}

class ExerciseModel {
  String exerciseName;
  String exerciseDescription;
  List<String> gifLocations;

  ExerciseModel(
      {required this.exerciseName,
      required this.exerciseDescription,
      required this.gifLocations});

  factory ExerciseModel.fromJson(Map<String, dynamic> parsedJson) {
    final gifLocationsFromJson = parsedJson["gifLocations"];

    return (ExerciseModel(
      exerciseName: parsedJson["exerciseName"],
      exerciseDescription: parsedJson["exerciseDescription"],
      gifLocations: List<String>.from(gifLocationsFromJson),
    ));
  }
}

// var streetsFromJson = parsedJson['streets'];
// List<String> streetsList = new List<String>.from(streetsFromJson);
