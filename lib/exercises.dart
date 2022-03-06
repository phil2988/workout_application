// import 'dart:convert';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/exercise-info-page.dart';
import 'package:workout_application/fitness_button.dart';

import 'exercise_data_models.dart';

class Exercises extends StatelessWidget {
  const Exercises({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getExerciseGroups(),
            builder:
                (context, AsyncSnapshot<List<ExerciseGroupModel>> snapshot) {
              // Switch for error handling regarding json read
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(child: Text("Error! No Connection!"));
                case ConnectionState.waiting:
                  return const Center(child: Text("Loading..."));
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    // Creates list of buttons for each exercise fetched
                    // from json if there is data
                    List<Widget> organizedList = [];
                    if (snapshot.hasData) {
                      organizedList.add(const Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0)));

                      for (ExerciseGroupModel exerciseGroup
                          in snapshot.data as List<ExerciseGroupModel>) {
                        organizedList.add(const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0)));

                        organizedList.add(Text(
                          exerciseGroup.categoryName,
                          style: subTitleStyle,
                        ));

                        organizedList.add(const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20)));
                        List<Widget> buttons = [];

                        for (var exercise
                            in exerciseGroup.exercises.exerciseModels) {
                          buttons.add(FitnessButton(
                              exercise.exerciseName,
                              () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ExerciseInfo(
                                                exercise.exerciseName,
                                                exercise.exerciseDescription,
                                                exercise.gifLocations)))
                                  }));
                        }

                        organizedList.add(Wrap(children: buttons));
                      }
                    }

                    return Container(
                        color: background,
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                            child: Column(
                          children: organizedList,
                        )));
                  }
              }
            }));
  }

  Future<List<ExerciseModel>> getExercisesFromGroup() async {
    String jsonString = await rootBundle.loadString("data/exerciseData.json");
    final jsonResponse = jsonDecode(jsonString);
    List<ExerciseModel> exercises = [];

    for (var exercise in jsonResponse["exercises"]) {
      exercises.add(ExerciseModel.fromJson(exercise));
    }

    return exercises;
  }

  Future<List<ExerciseGroupModel>> getExerciseGroups() async {
    String jsonString = await rootBundle.loadString("data/exerciseData.json");
    final jsonResponse = jsonDecode(jsonString);
    List<ExerciseGroupModel> exerciseGroups = [];

    for (var exerciseGroup in jsonResponse) {
      exerciseGroups.add(ExerciseGroupModel.fromJson(exerciseGroup));
    }

    return exerciseGroups;
  }
}
