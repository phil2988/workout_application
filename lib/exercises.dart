// import 'dart:convert';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_application/app_colors.dart';
import 'package:workout_application/fitness_button.dart';

import 'exercise_data_models.dart';

// import 'package:workout_application/exercise_data_model.dart';
// import 'package:workout_application/fitness_button.dart';

class Exercises extends StatelessWidget {
  // final benchPressWidgetsList = <Widget>[];
  // final List exerciseData = [];

  const Exercises({Key? key}) : super(key: key);

  static const TextStyle titleStyle = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      height: 2.5);
  static const TextStyle subTitleStyle =
      TextStyle(fontSize: 23, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: readJson(),
            builder: (context, AsyncSnapshot<List<ExerciseModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(child: Text("What?!?..."));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Text("Loading..."));
              } else {
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else {
                  List<Widget> buttons = [];

                  if (snapshot.hasData) {
                    for (var item in snapshot.data as List<ExerciseModel>) {
                      buttons.add(FitnessButton(item.exerciseName));
                    }
                  }
                  return Container(
                      color: background,
                      alignment: Alignment.center,
                      child: Column(children: [
                        const Text("Choose A Workout", style: titleStyle),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                        const Text("Bænkpres", style: subTitleStyle),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                        Wrap(children: buttons),
                      ]));
                }
              }
            }));
  }

  Future<List<ExerciseModel>> readJson() async {
    String jsonString = await rootBundle.loadString("data/exerciseData.json");
    final jsonResponse = jsonDecode(jsonString);
    List<ExerciseModel> exercises = [];

    for (var exercise in jsonResponse["exercises"]) {
      exercises.add(ExerciseModel.fromJson(exercise));
    }

    return exercises;
  }
}
