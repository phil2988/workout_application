import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workout_application/general-components/app_card.dart';
import 'package:workout_application/general_functions/futurebuilder_builder.dart';
import 'package:workout_application/theme/theme_handler.dart';

import '../app_configs.dart';
import '../general_functions/on_tap_functions.dart';
import '../models/workout.dart';

class WorkoutsOverview extends StatelessWidget {
  const WorkoutsOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();
    return Scaffold(
        backgroundColor: theme.color!.background,
        body: FutureBuilder(
            future: getWorkouts(),
            builder: (context, AsyncSnapshot<List<Workout>> snapshot) {
              List<Widget> cards = [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.1,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.8,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Workouts Overview",
                                style: theme.text!.title,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.1,
                            child: RawMaterialButton(
                              fillColor: const Color(0xff73D493),
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(30))),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )
              ];
              if (snapshot.hasData) {
                for (var item in snapshot.data as List<Workout>) {
                  cards.add(AppCard(
                    title: item.title,
                    description: item.description,
                    onPressed: workoutCardOnTap(context, item),
                    outerPadding: const EdgeInsets.symmetric(vertical: 20),
                  ));
                }
              }
              return getFutureBuilderErrorHandling(
                  snapshot: snapshot,
                  returnWidget: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: SingleChildScrollView(
                          child: Padding(
                        padding: EdgeInsets.zero,
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
