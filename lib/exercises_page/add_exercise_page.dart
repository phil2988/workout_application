import 'package:flutter/material.dart';
import 'package:workout_application/exercises_page/add_exercise_form.dart';

import '../general_functions/get_appbar_functions.dart';
import '../theme/theme_handler.dart';

class AddExercisePage extends StatelessWidget {
  const AddExercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: getGoBackAppBar(),
        backgroundColor: ThemeHandler().getTheme().color!.background,
        body: const AddExerciseForm(),
      ),
    );
  }
}
