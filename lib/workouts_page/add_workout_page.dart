import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_application/general_functions/get_appbar_functions.dart';
import 'package:workout_application/theme/app_themes.dart';

import 'add_workout_form.dart';

class AddWorkoutPage extends StatelessWidget {
  const AddWorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getGoBackAppBar(),
      backgroundColor: ThemeHandler().getTheme().colorScheme.background,
      body: const AddWorkoutForm(),
    );
  }
}
