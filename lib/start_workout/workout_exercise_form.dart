import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general-components/app_button.dart';
import 'package:workout_application/models/exercise-data.dart';
import 'package:workout_application/models/exercise.dart';
import 'package:workout_application/start_workout/small-number-input.dart';

import '../general_functions/backend-submits.dart';

class WorkoutExerciseForm extends StatefulWidget {
  const WorkoutExerciseForm(
      {
        required this.exercises, 
        Key? key
      }) : super(key: key);

  final List<Exercise> exercises;

  @override
  State<WorkoutExerciseForm> createState() => _WorkoutExerciseFormState();
}

class _WorkoutExerciseFormState extends State<WorkoutExerciseForm> {
  late TextEditingController repsController;
  late TextEditingController setsController;
  late TextEditingController weightController;

  bool isValid = false;
  int currentExercise = 0;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    repsController = TextEditingController();
    setsController = TextEditingController();
    weightController = TextEditingController();

    repsController.addListener(_updateIsValid);
    setsController.addListener(_updateIsValid);
    weightController.addListener(_updateIsValid);

    super.initState();
  }

  @override
  void dispose() {
    repsController.dispose();
    setsController.dispose();
    weightController.dispose();

    super.dispose();
  }

  _updateIsValid() {
    setState(() {
      isValid = repsController.text.isNotEmpty && setsController.text.isNotEmpty && weightController.text.isNotEmpty;
    });
  }


  @override
  Widget build(BuildContext context) {
    Future onSubmit() async {
      final res = await submitExerciseData(
                  ExerciseData(
                    exercise: widget.exercises[currentExercise], 
                    reps: int.parse(repsController.text), 
                    sets: int.parse(setsController.text), 
                    weight: double.parse(weightController.text)));
      if(res == 200) {
        setState(() {
          if(currentExercise == widget.exercises.length -1){
            Navigator.pop(context);
          } else {
            currentExercise++;
          }
        });
      }
    }
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Padding(
                padding: titlePadding,
                child: Text(
                  widget.exercises[currentExercise].title,
                  style: subTitleStyle,
                )),
          Padding(
            padding: defaultPadding, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallNumberInput(text: "Reps", controller: repsController),
                const SizedBox(
                  width: 30,
                ),
                SmallNumberInput(text: "Sets", controller: setsController,),
                const SizedBox(
                  width: 30,
                ),
                SmallNumberInput(
                  text: "Weight",
                  suffix: "Kg",
                  width: 70,
                  controller: weightController,
                )
              ],
            )
          ),
          Padding(
            padding: defaultPadding,
            child: AppButton(
              disabled: !isValid,
              buttonText: "Finish Exercise",
              onPressed: onSubmit,
              buttonHeight: 50,
              buttonWidth: 180,
            )
          )
        ],
      )
    );
  }
}
