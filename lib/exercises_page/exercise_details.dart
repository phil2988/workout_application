import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general_functions/backend_fetches.dart';
import 'package:workout_application/general_functions/futurebuilder_builder.dart';
import 'package:workout_application/general_functions/on_tap_functions.dart';
import 'package:workout_application/models/exercise.dart';
import 'package:workout_application/theme/app_themes.dart';

import '../general_functions/get_appbar_functions.dart';
import '../general_functions/utility.dart';

class ExerciseDetails extends StatelessWidget {
  ExerciseDetails(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageUrl})
      : super(key: key);

  final String title;
  final String description;
  final String imageUrl;

  late Future getExerciseVariationsFuture = getExerciseVariations();

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: getGoBackAppBar(),
        body: SingleChildScrollView(
            child: Padding(
                padding: defaultPadding,
                child: Column(
                  children: [
                    getTitleAndDescription(title, description),
                    getMuscleGroupSection(imageUrl),
                    getVariationsSection(),
                    const SizedBox(height: 15)
                  ],
                ))));
  }

  getVariationsSection() {
    final theme = ThemeHandler().getTheme();
    return FutureBuilder(
        future: getExerciseVariationsFuture,
        builder: (context, AsyncSnapshot snapshot) {
          List<Widget> variationLinks = [];
          if (snapshot.hasData) {
            variationLinks
                .add(const Divider(color: Colors.white, thickness: 1));
            for (Exercise exercise in snapshot.data) {
              variationLinks.add(GestureDetector(
                child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      exercise.title,
                      style: theme.textTheme.bodyText1,
                    )),
                onTap: exerciseAppButtonOnTap(context, exercise),
              ));
              variationLinks
                  .add(const Divider(color: Colors.white, thickness: 1));
            }
            if (variationLinks.length == 1) {
              variationLinks.add(Text(
                "No variations found for this exercise",
                style: theme.textTheme.bodyText1,
              ));
            }
          }
          return getFutureBuilderErrorHandling(
              snapshot: snapshot,
              returnWidget: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                    width: double.infinity,
                    child: ExpandablePanel(
                        theme:
                            const ExpandableThemeData(iconColor: Colors.white),
                        header: Text("Exercise Variations",
                            style: theme.textTheme.subtitle1),
                        collapsed: Container(),
                        expanded: ScrollOnExpand(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: variationLinks),
                        ))),
              ));
        });
  }

  Future getExerciseVariations() async {
    List<Exercise> variations = [];
    final exercises = await getExercises();

    for (var exercise in exercises) {
      if (exercise.parentExercise.contains(title)) {
        variations.add(exercise);
      }
    }
    return variations;
  }

  getTitleAndDescription(String title, String description) {
    final theme = ThemeHandler().getTheme();
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            title,
            style: theme.textTheme.headline1,
          ),
        ),
        SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Description",
                style: theme.textTheme.subtitle1,
              ),
            )),
        SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                description,
                style: theme.textTheme.bodyText1,
              ),
            )),
      ],
    );
  }

  getMuscleGroupSection(String url) {
    final theme = ThemeHandler().getTheme();
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Muscle Groups",
                style: theme.textTheme.subtitle1,
              ),
            )),
        SizedBox(
          width: double.infinity,
          child: Image.network(getImageUrl(exerciseUrl: url)),
        )
      ],
    );
  }
}
