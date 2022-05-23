class Exercise {
  String name;
  String description;
  String images;
  String category;

  Exercise(
      {required this.name,
      required this.description,
      required this.category,
      required this.images});

  factory Exercise.fromJson(Map<String, dynamic> parsedJson) {
    return (Exercise(
      name: parsedJson["name"],
      description: parsedJson["description"],
      images: parsedJson["images"],
      category: parsedJson["category"],
    ));
  }
}
