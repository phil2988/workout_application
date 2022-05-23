import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/models/list_of_exercises.dart';

import '../general-components/app_card.dart';

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails(this.title, this.description, this.exercises, {Key? key})
      : super(key: key);

  final String title;
  final String description;
  final ExercisesList exercises;

  @override
  Widget build(BuildContext context) {
    List<AppCard> exerciseCards = [];
    for (var item in exercises.exercises) {
      exerciseCards.add(AppCard(item.name, item.description, () {}));
    }

    return Scaffold(
        backgroundColor: background,
        appBar:
            AppBar(backgroundColor: background, title: const Text("Go Back")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(title, style: titleStyle),
              Padding(
                padding: defaultPadding,
                child: Text(
                  description,
                  style: contentStyle,
                ),
              ),
              const Padding(
                padding: defaultPadding,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Exercises in this workout:",
                      style: subTitleStyle,
                    )),
              ),
              ...exerciseCards
            ],
          ),
        ));
  }
}
