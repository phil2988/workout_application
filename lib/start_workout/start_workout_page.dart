import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general-components/app_card.dart';

import '../general-components/app_button.dart';
import '../general_functions/onTapFunctions.dart';
import '../models/workout.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class StartWorkout extends StatelessWidget {
  const StartWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
            backgroundColor: background,
            title: const Text("Start Workout", style: titleStyle),
            centerTitle: true),
        body: FutureBuilder(
            future: getDefaultWorkout(),
            builder: (context, AsyncSnapshot<Workout> workout) {
              // Switch for error handling regarding json read
              switch (workout.connectionState) {
                case ConnectionState.none:
                  return noConnectionContainer;
                case ConnectionState.waiting:
                  return loadingContainer;
                default:
                  if (workout.hasError) {
                    return Center(
                        child: Text(
                      "Error: ${workout.error}",
                      style: subTitleStyle,
                    ));
                  } else {
                    final workoutdata = workout.data as Workout;
                    return Column(
                      children: [
                        const Padding(padding: titlePadding, child: Text("Choosen Workout", style: subTitleStyle,),
                        ),
                        AppCard(workoutdata.title, workoutdata.description,
                            workoutCardOnTap(context, workoutdata)),
                        AppButton( buttonText: "Start Workout",
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

Widget noConnectionContainer = Container(
  child: const Text(
    "Error! No Connection!",
    style: subTitleStyle,
  ),
  alignment: Alignment.topCenter,
  color: background,
);

Widget loadingContainer = Container(
  child: const Text(
    "Loading...",
    style: subTitleStyle,
  ),
  alignment: Alignment.topCenter,
  color: background,
);
