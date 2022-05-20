import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final double buttonWidth;
  final double buttonHeight;
  final OutlinedBorder shape;
  final TextStyle textStyle;

  const AppButton(
    this.buttonText,
    this.onPressed, {
    Key? key,
    this.textStyle = buttonStyle,
    this.buttonWidth = 180,
    this.buttonHeight = 65,
    this.shape = const StadiumBorder(side: BorderSide(width: 3, color: Colors.white)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: defaultPadding,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText, style: contentStyle),
          style: ElevatedButton.styleFrom(
              textStyle: textStyle,
              fixedSize: Size(buttonWidth, buttonHeight),
              primary: primary,
              onPrimary: Colors.white,
              shape: shape
        )));
  }
}
