import 'dart:convert';
import 'package:http/http.dart' as http;
import '../app_configs.dart';
import '../models/exercise_data.dart';

Future<int> submitExerciseData(ExerciseData exerciseData) async {
    Map<String, String> options = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };

  var url = Uri.parse(apiUrl + 'exerciseData');
  final data = jsonEncode(exerciseData);

  final response = await http.post(
    url, headers: options, body: data );

  return response.statusCode;
}

