import 'package:workout_application/models/exercise.dart';

class ExerciseData{

  Exercise exercise;
  int reps;
  int sets;
  double weight;

  ExerciseData({required this.exercise, required this.reps, required this.sets, required this.weight});

  Map<String, dynamic> toJson(){
    Map<String, dynamic> exercise = this.exercise.toJson();
    
    return {"exercise": exercise, "reps": reps, "sets": sets, "weight": weight};
  }

}

//   class Exercise {
//   String title;
//   String description;
//   String images;
//   String category;

//   Exercise(
//       {required this.title,
//       required this.description,
//       required this.category,
//       required this.images});

//   factory Exercise.fromJson(Map<String, dynamic> parsedJson) {
//     return (Exercise(
//       title: parsedJson["title"],
//       description: parsedJson["description"],
//       images: parsedJson["images"],
//       category: parsedJson["category"],
//     ));
//   }
// }