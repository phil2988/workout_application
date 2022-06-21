class Exercise {
  Exercise({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.images
  });

  final String? id;
  final String title;
  final String description;
  final String images;
  final String category;

  factory Exercise.fromJson(Map<String, dynamic> parsedJson) {
    return (
      Exercise(
        id: parsedJson["id"] ?? "", 
        title: parsedJson["title"],
        description: parsedJson["description"],
        images: parsedJson["images"],
        category: parsedJson["category"],
      )
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id ?? "",
    "title": title,
    "description": description,
    "category": category,
    "images": images 
  };
}
