import 'package:flutter/material.dart';
import 'package:workout_application/theme/app_themes.dart';
import '../app_configs.dart';

class AppCard extends StatelessWidget {
  const AppCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.onPressed,
      this.buttonWidth = double.maxFinite,
      this.buttonHeight = 150,
      this.shape = const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(15)))})
      : super(key: key);

  final String title;
  final String description;
  final void Function() onPressed;
  final double buttonWidth;
  final double buttonHeight;
  final OutlinedBorder shape;

  @override
  Widget build(BuildContext context) {
    final cutDescription = description.length >= 100
        ? description.substring(0, 100) + "..."
        : description;
    final theme = ThemeHandler().getTheme();
    return Padding(
        padding: defaultPadding,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(title, style: theme.textTheme.subtitle1),
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(cutDescription, style: theme.textTheme.bodyText1))
            ],
          ),
          style: ElevatedButton.styleFrom(
              textStyle: theme.textTheme.button,
              fixedSize: Size(buttonWidth, buttonHeight),
              primary: ThemeHandler().getTheme().colorScheme.primary,
              onPrimary: Colors.white,
              shape: shape),
        ));
  }
}
