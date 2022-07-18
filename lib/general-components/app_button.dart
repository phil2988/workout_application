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
  final EdgeInsets buttonPadding;

  const AppButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.disabled = false,
      this.loading = false,
      this.buttonWidth = 180,
      this.buttonHeight = 65,
      this.shape = const StadiumBorder(side: BorderSide(color: Colors.white)),
      this.buttonPadding = const EdgeInsets.all(5)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();

    return Padding(
        padding: buttonPadding,
        child: Material(
          color: theme.colorScheme.primary,
          shape: const StadiumBorder(),
          child: InkWell(
            customBorder: shape,
            onTap: loading || disabled ? null : onPressed,
            child: Container(
              decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  shadows: [
                    BoxShadow(blurRadius: 5, blurStyle: BlurStyle.outer)
                  ]),
              child: SizedBox(
                  height: buttonHeight,
                  width: buttonWidth,
                  child: Align(
                    alignment: Alignment.center,
                    child: loading
                        ? const CircularProgressIndicator()
                        : Text(
                            buttonText,
                            style: theme.textTheme.button,
                            textAlign: TextAlign.center,
                          ),
                  )),
            ),
          ),
        ));
  }
}
