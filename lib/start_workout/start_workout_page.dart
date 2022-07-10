import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general-components/app_card.dart';
import 'package:workout_application/theme/app_themes.dart';

import '../general-components/app_button.dart';
import '../general_functions/get_appbar_functions.dart';
import '../general_functions/on_tap_functions.dart';
import '../models/workout.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class StartWorkout extends StatelessWidget {
  const StartWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: getStartWorkoutAppBar(),
        body: FutureBuilder(
            future: getDefaultWorkout(),
            builder: (context, AsyncSnapshot<Workout> workout) {
              switch (workout.connectionState) {
                case ConnectionState.none:
                  return Container(
                    child: Text(
                      "Error! No Connection!",
                      style: theme.textTheme.subtitle1,
                    ),
                    alignment: Alignment.topCenter,
                    color: theme.colorScheme.background,
                  );
                case ConnectionState.waiting:
                  return Container(
                    child: Text(
                      "Loading...",
                      style: theme.textTheme.subtitle1,
                    ),
                    alignment: Alignment.topCenter,
                    color: theme.colorScheme.background,
                  );
                default:
                  if (workout.hasError) {
                    return Center(
                        child: Text(
                      "Error: ${workout.error}",
                      style: theme.textTheme.subtitle1,
                    ));
                  } else {
                    final workoutdata = workout.data as Workout;
                    return Column(
                      children: [
                        Padding(
                          padding: titlePadding,
                          child: Text(
                            "Default Workout",
                            style: theme.textTheme.subtitle1,
                          ),
                        ),
                        AppCard(
                            title: workoutdata.title,
                            description: workoutdata.description,
                            onPressed: workoutCardOnTap(context, workoutdata)),
                        AppButton(
                            buttonText: "Start Workout",
                            onPressed: startWorkoutOnTap(context, workoutdata))
                      ],
                    );
                  }
              }
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
