class ExerciseGroupModel {
  String categoryName;
  List<ExerciseModel> exercises;

  ExerciseGroupModel({required this.categoryName, required this.exercises});
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
