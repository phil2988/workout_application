import 'package:flutter/material.dart';
import '../app_configs.dart';
import '../models/exercise.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<List<Exercise>> getExercises() async {
    List<Exercise> exerciseGroups = [];

    var url = Uri.parse(apiUrl + 'exercise');

    Map<String, String> options = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    var response = await http.get(url, headers: options);

    if (response.statusCode == 200) {
      var jsonResponse = convert.json.decode(response.body);

      for (var item in jsonResponse) {
        exerciseGroups.add(Exercise.fromJson(item));
      }
      return exerciseGroups;
    }

    throw ErrorSummary("Could not find any exercises");
  }