import 'package:flutter/material.dart';
import 'package:workout_application/app_colors.dart';

class FitnessButton extends StatelessWidget {
  final String displayText;

  const FitnessButton(this.displayText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(displayText),
          style: ElevatedButton.styleFrom(
              textStyle: buttonStyle,
              fixedSize: const Size(150, 50),
              primary: primary,
              onPrimary: Colors.white,
              shape: const StadiumBorder(
                  side: BorderSide(width: 3, color: Colors.white))),
        ));
  }
}
