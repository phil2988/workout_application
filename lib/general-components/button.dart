import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final double buttonWidth;
  final double buttonHeight;

  const AppButton(
    this.buttonText,
    this.onPressed, {
    Key? key,
    this.buttonWidth = 180,
    this.buttonHeight = 65,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText, style: contentStyle),
          style: ElevatedButton.styleFrom(
              textStyle: buttonStyle,
              fixedSize: Size(buttonWidth, buttonHeight),
              primary: primary,
              onPrimary: Colors.white,
              shape: const StadiumBorder(
                  side: BorderSide(width: 3, color: Colors.white))),
        ));
  }
}
