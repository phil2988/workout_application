import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final double buttonWidth;
  final double buttonHeight;
  final OutlinedBorder shape;
  final TextStyle textStyle;
  final bool loading;
  final bool disabled;

  const AppButton(
  {
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.disabled = false,
    this.loading = false,
    this.textStyle = buttonStyle,
    this.buttonWidth = 180,
    this.buttonHeight = 65,
    this.shape =
        const StadiumBorder(side: BorderSide(width: 3, color: Colors.white)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: buttonPadding,
        child: ElevatedButton(
            onPressed: loading || disabled? null: onPressed,
            child: loading? const CircularProgressIndicator() : Text(buttonText, style: contentStyle),
            style: ElevatedButton.styleFrom(
                textStyle: textStyle,
                fixedSize: Size(buttonWidth, buttonHeight),
                primary: primary,
                onPrimary: Colors.white,
                shape: shape)));
  }
}