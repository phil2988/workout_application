import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/theme/app_themes.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final double buttonWidth;
  final double buttonHeight;
  final OutlinedBorder shape;
  final bool loading;
  final bool disabled;

  const AppButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.disabled = false,
    this.loading = false,
    this.buttonWidth = 180,
    this.buttonHeight = 65,
    this.shape =
        const StadiumBorder(side: BorderSide(width: 3, color: Colors.white)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();
    return Padding(
        padding: buttonPadding,
        child: ElevatedButton(
            onPressed: loading || disabled ? null : onPressed,
            child: loading
                ? const CircularProgressIndicator()
                : Text(
                    buttonText,
                    style: theme.textTheme.button,
                    textAlign: TextAlign.center,
                  ),
            style: ElevatedButton.styleFrom(
                textStyle: theme.textTheme.button,
                fixedSize: Size(buttonWidth, buttonHeight),
                primary: theme.colorScheme.primary,
                onPrimary: theme.colorScheme.onPrimary,
                shape: shape)));
  }
}
