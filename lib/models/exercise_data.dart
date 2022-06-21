import 'exercise.dart';

class ExerciseData{
  ExerciseData({
    required this.exercise, 
    required this.reps, 
    required this.sets, 
    required this.weight
  });

  final Exercise exercise;
  final int reps;
  final int sets;
  final double weight;

  Map<String, dynamic> toJson(){
    Map<String, dynamic> exercise = this.exercise.toJson();
    
    return {
      "exercise": exercise, 
      "reps": reps, 
      "sets": sets, 
      "weight": weight
    };
  }
}