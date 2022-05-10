import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';

class ExerciseButton extends StatelessWidget {
  final String displayText;
  final void Function() onPressed;

  const ExerciseButton(this.displayText, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(displayText, style: contentStyle),
          style: ElevatedButton.styleFrom(
              textStyle: buttonStyle,
              fixedSize: const Size(180, 65),
              primary: primary,
              onPrimary: Colors.white,
              shape: const StadiumBorder(
                  side: BorderSide(width: 3, color: Colors.white))),
        ));
  }
}
