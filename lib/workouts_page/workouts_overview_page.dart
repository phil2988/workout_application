import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:workout_application/general-components/app_card.dart';
import '../app_configs.dart';
import '../general_functions/onTapFunctions.dart';
import '../models/workout.dart';

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
            future: getWorkouts(),
            builder: (context, AsyncSnapshot<List<Workout>> workouts) {
              // Switch for error handling regarding json read
              switch (workouts.connectionState) {
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
                  if (workouts.hasError) {
                    return Center(child: Text("Error: ${workouts.error}"));
                  } else {
                    List<AppCard> cards = [];

                    for (var item in workouts.data as List<Workout>) {
                      cards.add(AppCard(item.title, item.description,
                          workoutCardOnTap(context, item)));
                    }

                    return SingleChildScrollView(
                        child: Container(
                      alignment: Alignment.topCenter,
                      child: Column(children: cards),
                    ));
                  }
              }
            }));
  }
}

Future<List<Workout>> getWorkouts() async {
  List<Workout> workouts = [];

  Map<String, String> options = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };

  var url = Uri.parse(apiUrl + 'workout');
  final response = await http.get(url, headers: options);

  if (response.statusCode == 200) {
    final jsonResponse = convert.json.decode(response.body);

    for (var item in jsonResponse) {
      workouts.add(Workout.fromJson(item));
    }
    return workouts;
  }

  throw ErrorSummary("Could not find any exercises");
}
