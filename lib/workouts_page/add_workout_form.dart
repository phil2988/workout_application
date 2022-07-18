import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general_functions/backend_fetches.dart';
import 'package:workout_application/models/exercise.dart';
import 'package:workout_application/theme/app_themes.dart';

import '../general_functions/futurebuilder_builder.dart';

class AddWorkoutForm extends StatefulWidget {
  const AddWorkoutForm({Key? key}) : super(key: key);

  @override
  State<AddWorkoutForm> createState() => AddWorkoutFormState();
}

class AddWorkoutFormState extends State<AddWorkoutForm> {
  List<Exercise> exercisesInWorkout = <Exercise>[];
  List<Exercise> exercisesNotInWorkout = [];

  final formKey = GlobalKey<FormState>();
  final theme = ThemeHandler().getTheme();

  late Future getExercisesNotInWorkoutFuture = getExercisesNotInWorkout();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: defaultPadding,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Add Workout",
                  style: theme.textTheme.headline1,
                ),
              ),
            ),
            getExercisesInWorkoutSection(),
            getExercisesNotInWorkoutSection(),
          ],
        ),
      ),
    );
  }

  updatePage() => setState(() {});

  getExercisesNotInWorkoutSection() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Exercises not in workout",
              style: theme.textTheme.subtitle1,
            ),
          ),
        ),
        FutureBuilder(
            future: getExercisesNotInWorkoutFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) exercisesNotInWorkout = snapshot.data;
              return getFutureBuilderErrorHandling(
                  snapshot: snapshot,
                  returnWidget: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: theme.colorScheme.onBackground)),
                    child: SizedBox(
                      height: 200,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: exercisesNotInWorkout.isNotEmpty
                                  ? [
                                      Text(exercisesNotInWorkout[index].title,
                                          style: theme.textTheme.bodyText1),
                                      IconButton(
                                        onPressed: () {
                                          exercisesInWorkout.add(
                                              exercisesNotInWorkout[index]);
                                          exercisesNotInWorkout.remove(
                                              exercisesNotInWorkout[index]);
                                          updatePage();
                                        },
                                        icon: const Icon(Icons.add),
                                        color: theme.colorScheme.onBackground,
                                        splashRadius: 20,
                                      ),
                                    ]
                                  : [
                                      Text(
                                          "No exercises in this workout yet...",
                                          style: theme.textTheme.bodyText1),
                                    ],
                            ),
                          );
                        },
                        itemCount: exercisesNotInWorkout.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: theme.colorScheme.onBackground,
                            thickness: 1,
                          );
                        },
                      ),
                    ),
                  ));
            }),
      ],
    );
  }

  Future getExercisesNotInWorkout() async {
    List<Exercise> exercises = await getExercises();

    return exercises
        .where((element) => !exercisesInWorkout.contains(element))
        .toList();
  }

  getExercisesInWorkoutSection() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Exercises in workout",
              style: theme.textTheme.subtitle1,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.onBackground)),
          child: SizedBox(
            height: 200,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(exercisesInWorkout[index].title,
                          style: theme.textTheme.bodyText1),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            exercisesNotInWorkout.isEmpty
                                ? () {
                                    exercisesNotInWorkout = <Exercise>[];
                                    exercisesInWorkout
                                        .add(exercisesInWorkout[index]);
                                  }
                                : exercisesNotInWorkout
                                    .add(exercisesInWorkout[index]);
                            exercisesInWorkout
                                .remove(exercisesInWorkout[index]);
                          });
                        },
                        icon: const Icon(Icons.remove),
                        color: theme.colorScheme.onBackground,
                        splashRadius: 20,
                      ),
                    ],
                  ),
                );
              },
              itemCount: exercisesInWorkout.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: theme.colorScheme.onBackground,
                  thickness: 1,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
