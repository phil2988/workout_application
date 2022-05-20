import 'package:flutter/material.dart';
import 'package:workout_application/general-components/button.dart';

import '../app_configs.dart';
import '../models/exercise_data_models.dart';

class WorkoutsOverview extends StatelessWidget {
  const WorkoutsOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
            backgroundColor: background,
            title: const Text("Workouts Overview", style: titleStyle),
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
                    return SingleChildScrollView(
                        child: Container(
                      alignment: Alignment.topCenter,
                      child: Column(children: [
                        AppButton(
                          "Chest focused workout",
                          () async => {},
                          textStyle: subTitleStyle,
                          buttonHeight: 100,
                          buttonWidth: double.maxFinite,
                          shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.white, width: 3), borderRadius: BorderRadius.all(Radius.circular(15))),
                        ),
                        AppButton(
                          "Workout that makes your legs die",
                          () async => {},
                          textStyle: subTitleStyle,
                          buttonHeight: 100,
                          buttonWidth: double.maxFinite,
                          shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.white, width: 3), borderRadius: BorderRadius.all(Radius.circular(15))),
                        ),
                        AppButton(
                          "I like big buts and i cannot lie",
                          () async => {},
                          textStyle: subTitleStyle,
                          buttonHeight: 100,
                          buttonWidth: double.maxFinite,
                          shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.white, width: 3), borderRadius: BorderRadius.all(Radius.circular(15))),
                        ),
                      ]),
                    ));
                  }
              }
            }));
  }
}

Future<List<ExerciseModel>> getExercises() async {
  return [];
}
