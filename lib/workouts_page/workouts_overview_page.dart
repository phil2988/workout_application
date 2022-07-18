import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workout_application/general-components/app_card.dart';
import 'package:workout_application/general_functions/futurebuilder_builder.dart';
import 'package:workout_application/general_functions/get_appbar_functions.dart';
import 'package:workout_application/theme/app_themes.dart';
import 'package:workout_application/workouts_page/add_workout_page.dart';

import '../app_configs.dart';
import '../general_functions/on_tap_functions.dart';
import '../models/workout.dart';

class WorkoutsOverview extends StatefulWidget {
  const WorkoutsOverview({Key? key}) : super(key: key);

  @override
  State<WorkoutsOverview> createState() => WorkoutsOverviewState();
}

class WorkoutsOverviewState extends State<WorkoutsOverview> {
  @override
  Widget build(BuildContext context) {
    VoidCallback? onPopFunction() {
      Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddWorkoutPage()))
          .then((value) => setState(() {}));
      return null;
    }

    final theme = ThemeHandler().getTheme();

    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: getWorkoutsOverviewAppBar(onPopFunction),
        body: FutureBuilder(
            future: getWorkouts(),
            builder: (context, AsyncSnapshot<List<Workout>> snapshot) {
              List<AppCard> cards = [];
              if (snapshot.hasData) {
                for (var item in snapshot.data as List<Workout>) {
                  cards.add(AppCard(
                      title: item.title,
                      description: item.description,
                      onPressed: workoutCardOnTap(context, item)));
                }
              }
              return getFutureBuilderErrorHandling(
                  snapshot: snapshot,
                  returnWidget: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: SingleChildScrollView(
                          child: Padding(
                        padding: titlePadding,
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Column(children: cards),
                        ),
                      ))));
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
