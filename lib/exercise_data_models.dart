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
  String name;
  String description;
  String images;
  String category;

  ExerciseModel(
      {required this.name,
      required this.description,
      required this.category,
      required this.images});

  factory ExerciseModel.fromJson(Map<String, dynamic> parsedJson) {
    return (ExerciseModel(
      name: parsedJson["name"],
      description: parsedJson["description"],
      images: parsedJson["images"],
      category: parsedJson["category"],
    ));
  }
}
