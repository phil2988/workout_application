class Exercise {
  String? id;
  String title;
  String description;
  String images;
  String category;

  Exercise(
      {
        this.id,
        required this.title,
        required this.description,
        required this.category,
        required this.images
      });

  factory Exercise.fromJson(Map<String, dynamic> parsedJson) {
    return (Exercise(
      id: parsedJson["id"] ?? "", 
      title: parsedJson["title"],
      description: parsedJson["description"],
      images: parsedJson["images"],
      category: parsedJson["category"],
    ));
  }

  Map<String, dynamic> toJson() => {
    "id": id ?? "",
    "title": title,
    "description": description,
    "category": category,
    "images": images 
  };
}
