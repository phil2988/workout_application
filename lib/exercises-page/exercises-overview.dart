import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/exercises-page/exercises-overview-categoriy.dart';

import '../models/exercise_data_models.dart';

class ExercisesOverview extends StatelessWidget {
  const ExercisesOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: background,
            title: const Text("Exercises Overview", style: titleStyle),
            centerTitle: true),
        body: FutureBuilder(
            future: getExercises(),
            builder: (context, AsyncSnapshot<List<ExerciseModel>> exercises) {
              // Switch for error handling regarding json read
              switch (exercises.connectionState) {
                case ConnectionState.none:
                  return const Center(child: Text("Error! No Connection!"));
                case ConnectionState.waiting:
                  return const Center(child: Text("Loading..."));
                default:
                  if (exercises.hasError) {
                    return Center(child: Text("Error: ${exercises.error}"));
                  } else {
                    final exercisesData = exercises.data as List<ExerciseModel>;
                    // Creates list of buttons for each exercise fetched
                    // from json if there is data
                    final categories =
                        getUniqueCategoriesWithExercises(exercisesData);
                    List<Widget> finalList = [];

                    for (var category in categories) {
                      final exercisesInCategory =
                          getExercisesWithCategory(category, exercisesData);
                      finalList.add(ExercisesOverviewCategory(
                          category, exercisesInCategory));
                    }

                    return Container(
                        color: background,
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                            child: Column(
                          children: finalList,
                        )));
                  }
              }
            }));
  }

  Future<List<ExerciseModel>> getExercises() async {
    List<ExerciseModel> exerciseGroups = [];

    var url = Uri.parse('https://10.0.2.2:7035/exercise');

    Map<String, String> options = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    var response = await http.get(url, headers: options);

    if (response.statusCode == 200) {
      var jsonResponse = convert.json.decode(response.body);

      for (var item in jsonResponse) {
        exerciseGroups.add(ExerciseModel.fromJson(item));
      }
      return exerciseGroups;
    } else {
      throw ErrorSummary("Could not find any exercises");
    }
  }

  List<String> getUniqueCategoriesWithExercises(List<ExerciseModel> models) {
    List<String> uniques = [];

    for (var exercise in models) {
      if (!uniques.contains(exercise.category)) {
        uniques.add(exercise.category);
      }
    }

    return uniques;
  }

  List<ExerciseModel> getExercisesWithCategory(
      String category, List<ExerciseModel> models) {
    List<ExerciseModel> exercises = [];

    for (var exercise in models) {
      if (!exercises.contains(category)) {
        exercises.add(exercise);
      }
    }

    return exercises;
  }
}
