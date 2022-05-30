class Exercise {
  String title;
  String description;
  String images;
  String category;

  Exercise(
      {required this.title,
      required this.description,
      required this.category,
      required this.images});

  factory Exercise.fromJson(Map<String, dynamic> parsedJson) {
    return (Exercise(
      title: parsedJson["title"],
      description: parsedJson["description"],
      images: parsedJson["images"],
      category: parsedJson["category"],
    ));
  }
}
