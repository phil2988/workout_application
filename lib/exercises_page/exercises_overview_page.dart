import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';

import '../general_functions/backend_fetches.dart';
import '../general_functions/get_appbar_functions.dart';
import '../general_functions/utility.dart';
import '../models/exercise.dart';
import 'add_exercise_page.dart';
import 'exercises_category_overview.dart';

class ExercisesOverview extends StatefulWidget {
  const ExercisesOverview({
    Key? key
  }) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => ExercisesOverviewState();
}

class ExercisesOverviewState extends State<ExercisesOverview> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: getExercisesAppBar(onPopFunction),
        body: FutureBuilder(
            future: getExercises(),
            builder: (context, AsyncSnapshot<List<Exercise>> exercises) {
              switch (exercises.connectionState) {
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
                  if (exercises.hasError) {
                    return Center(child: Text("Error: ${exercises.error}"));
                  } 
                  else {
                    final exercisesData = exercises.data as List<Exercise>;
                    final categories = getUniqueCategoriesWithExercises(exercisesData);
                    List<Widget> finalList = [];

                    for (var category in categories) {
                      List<Exercise> exercisesInCategory =
                          getExercisesWithCategory(category, exercisesData);
                      finalList.add(ExercisesCategoryOverview(
                          category: category, exercises: exercisesInCategory));
                    }

                    return FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 1,
                        child: Container(
                            color: background,
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                                child: Column(
                              children: finalList,
                            ))));
                  }
              }
            }));  
  }

  VoidCallback? onPopFunction(){
    Navigator
      .push(
        context,
        MaterialPageRoute(
            builder: (context) => const AddExercisePage()))
      .then((value) => setState((){}));
    return null;
  }


}
