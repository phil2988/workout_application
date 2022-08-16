import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general_functions/futurebuilder_builder.dart';
import 'package:workout_application/workout_icons.dart';

import '../general_functions/backend_fetches.dart';
import '../general_functions/get_appbar_functions.dart';
import '../general_functions/utility.dart';
import '../models/exercise.dart';
import '../theme/theme_handler.dart';
import 'add_exercise_page.dart';
import 'exercises_category_overview.dart';

class ExercisesOverview extends StatefulWidget {
  const ExercisesOverview({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExercisesOverviewState();
}

class ExercisesOverviewState extends State<ExercisesOverview> {
  final theme = ThemeHandler().getTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getExercises(),
            builder: (context, AsyncSnapshot<List<Exercise>> exercises) {
              List<Widget> finalList = [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
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
                                "Exercises Overview",
                                style: theme.text!.title,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.1,
                            child: RawMaterialButton(
                              fillColor: const Color(0xff73D493),
                              padding: EdgeInsets.zero,
                              onPressed: onPopFunction,
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
              if (exercises.hasData) {
                final exercisesData = exercises.data as List<Exercise>;
                final categories =
                    getUniqueCategoriesWithExercises(exercisesData);

                for (var category in categories) {
                  List<Exercise> exercisesInCategory =
                      getExercisesWithCategory(category, exercisesData);
                  finalList.add(ExercisesCategoryOverview(
                      category: category, exercises: exercisesInCategory));
                }
              }
              finalList.add(const SizedBox(height: 50));

              return getFutureBuilderErrorHandling(
                  snapshot: exercises,
                  returnWidget: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: Container(
                          color: theme.color!.background,
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                              child: Column(
                            children: finalList,
                          )))));
            }));
  }

  VoidCallback? onPopFunction() {
    Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddExercisePage()))
        .then((value) => setState(() {}));
    return null;
  }
}
