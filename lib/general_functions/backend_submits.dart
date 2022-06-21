import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:workout_application/models/exercise-data.dart';

import '../app_configs.dart';

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

