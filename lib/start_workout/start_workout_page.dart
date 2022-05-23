import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';

class StartWorkout extends StatelessWidget {
  const StartWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
            backgroundColor: background,
            title: const Text("Start Workout", style: titleStyle),
            centerTitle: true),
        body: Container());
  }
}
