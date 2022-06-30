import 'package:flutter/material.dart';
import 'package:workout_application/workout_icons.dart' as workout_icons;

import '../app_configs.dart';

getExercisesAppBar(VoidCallback onPopFunction){
  return AppBar(
    backgroundColor: background,
    title: LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: [
            Container(
              alignment: const Alignment(0, 0),
              child: const Text("Exercises Overview", style: titleStyle,)
            ),
            Container(
              alignment: const Alignment(1.08, 0),
              child: IconButton(
                icon: const Icon(workout_icons.Workout.startWorkoutIcon, size: 30,), 
                onPressed: onPopFunction,
                splashRadius: 25),
            )
          ],
        ); 
    }), 
    centerTitle: true
  );
}

getGoBackAppBar(){
  return  AppBar(backgroundColor: background, title: const Text("Go Back"));
}