import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general_functions/futurebuilder_builder.dart';

import '../general_functions/backend_fetches.dart';
import '../general_functions/get_appbar_functions.dart';
import '../general_functions/utility.dart';
import '../models/exercise.dart';
import '../theme/app_themes.dart';
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
        appBar: getExercisesAppBar(onPopFunction),
        body: FutureBuilder(
            future: getExercises(),
            builder: (context, AsyncSnapshot<List<Exercise>> exercises) {
              List<Widget> finalList = [];
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

              return getFutureBuilderErrorHandling(
                  snapshot: exercises,
                  returnWidget: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: Container(
                          color: theme.colorScheme.background,
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
