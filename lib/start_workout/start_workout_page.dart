import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general-components/app_card.dart';
import 'package:workout_application/general_functions/futurebuilder_builder.dart';
import 'package:workout_application/theme/theme_handler.dart';

import '../general-components/app_button.dart';
import '../general_functions/on_tap_functions.dart';
import '../models/workout.dart';

class StartWorkout extends StatelessWidget {
  const StartWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();
    return Scaffold(
        backgroundColor: theme.color!.background,
        body: FutureBuilder(
            future: getDefaultWorkout(),
            builder: (context, AsyncSnapshot<Workout> snapshot) {
              Workout workout = Workout();
              if (snapshot.hasData) {
                workout = snapshot.data as Workout;
              }
              return getFutureBuilderErrorHandling(
                  snapshot: snapshot,
                  returnWidget: SizedBox(
                    width: double.infinity,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          "Start Workout",
                          style: theme.text!.title,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child: Text(
                          "Default Workout",
                          style: theme.text!.subtitle,
                        ),
                      ),
                      AppCard(
                          title: workout.title,
                          description: workout.description,
                          onPressed: workoutCardOnTap(context, workout)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: AppButton(
                            buttonText: "Start Workout",
                            onPressed: startWorkoutOnTap(context, workout)),
                      )
                    ]),
                  ));
            }));
  }
}

Future<Workout> getDefaultWorkout() async {
  var url = Uri.parse(apiUrl + 'workout/default');

  Map<String, String> options = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };

  var response = await http.get(url, headers: options);

  if (response.statusCode == 200) {
    final jsonResponse = convert.json.decode(response.body);
    return Workout.fromJson(jsonResponse);
  }

  throw ErrorSummary("Could not find any exercises");
}
