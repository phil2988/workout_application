import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workout_application/app_configs.dart';
import '../models/exercise.dart';
import 'exercises_category_overview.dart';

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
            builder: (context, AsyncSnapshot<List<Exercise>> exercises) {
              // Switch for error handling regarding json read
              switch (exercises.connectionState) {
                case ConnectionState.none:
                  return Container(
                    child: const Text(
                      "Error! No Connection!",
                      style: subTitleStyle,
                    ),
                    alignment: Alignment.topCenter,
                    color: background,
                  );
                case ConnectionState.waiting:
                  return Container(
                    child: const Text(
                      "Loading...",
                      style: subTitleStyle,
                    ),
                    alignment: Alignment.topCenter,
                    color: background,
                  );
                default:
                  if (exercises.hasError) {
                    return Center(child: Text("Error: ${exercises.error}"));
                  } else {
                    final exercisesData = exercises.data as List<Exercise>;
                    final categories =
                        getUniqueCategoriesWithExercises(exercisesData);
                    List<Widget> finalList = [];

                    for (var category in categories) {
                      List<Exercise> exercisesInCategory =
                          getExercisesWithCategory(category, exercisesData);
                      finalList.add(ExercisesCategoryOverview(
                          category, exercisesInCategory));
                    }

                    return FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 1,
                        child: Container(
                            color: background,
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                                child: Column(
                              children: finalList,
                            ))));
                  }
              }
            }));
  }

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

  List<String> getUniqueCategoriesWithExercises(List<Exercise> models) {
    List<String> uniques = [];

    for (var exercise in models) {
      if (!uniques.contains(exercise.category)) {
        uniques.add(exercise.category);
      }
    }

    return uniques;
  }

  List<Exercise> getExercisesWithCategory(
      String category, List<Exercise> models) {
    List<Exercise> exercises = [];

    for (var exercise in models) {
      // ignore: iterable_contains_unrelated_type
      if (!exercises.contains(category)) {
        exercises.add(exercise);
      }
    }

    return exercises;
  }
}
