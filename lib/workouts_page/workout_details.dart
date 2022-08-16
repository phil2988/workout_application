import 'package:flutter/material.dart';
import 'package:workout_application/general-components/app_list.dart';
import 'package:workout_application/general_functions/get_appbar_functions.dart';
import 'package:workout_application/models/exercise.dart';
import 'package:workout_application/theme/theme_handler.dart';

import '../general-components/app_list_entry_exercise.dart';

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails(this.title, this.description, this.exercises, {Key? key})
      : super(key: key);

  final String title;
  final String description;
  final List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();
    return Scaffold(
        backgroundColor: theme.color!.background,
        appBar: getGoBackAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          title,
                          style: theme.text!.title,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          description,
                          style: theme.text!.bodyAlt,
                        ),
                      ),
                    ],
                  ),
                ),
                AppList(
                  listTitle: "Exercises in this workout",
                  listEntries: getListEntries(exercises),
                )
              ],
            ),
          ),
        ));
  }

  getListEntries(List<Exercise> exercises) {
    final theme = ThemeHandler().getTheme();
    List<AppListEntryExercise> listExercises = [];
    for (var i = 0; i < exercises.length; i++) {
      listExercises.add(AppListEntryExercise(
        entryTitle: exercises[i].title,
        entryDescription: exercises[i].description,
        entryBackroundColor:
            i.isEven ? theme.color!.primary! : theme.color!.secondary!,
        entryPadding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
        lastInList: i == exercises.length - 1 ? true : false,
      ));
    }
    return listExercises;
  }
}
