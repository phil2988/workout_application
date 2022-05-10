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
                          "",
                          () async => {},
                          buttonHeight: 100,
                          buttonWidth: 300,
                        ),
                        AppButton(
                          "",
                          () async => {},
                          buttonHeight: 100,
                          buttonWidth: 350,
                        ),
                        AppButton(
                          "",
                          () async => {},
                          buttonHeight: 100,
                          buttonWidth: 350,
                        )
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
