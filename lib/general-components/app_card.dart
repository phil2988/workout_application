import 'package:flutter/material.dart';
import '../app_configs.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.title, 
    required this.description, 
    required this.onPressed,
    this.textStyle = buttonStyle,
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
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final cutDescription = description.length >= 100 ? description.substring(0, 100) + "..." : description;

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
                    child: Text(title, style: subTitleStyle),
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(cutDescription, style: contentStyle))
            ],
          ),
          style: ElevatedButton.styleFrom(
              textStyle: textStyle,
              fixedSize: Size(buttonWidth, buttonHeight),
              primary: primary,
              onPrimary: Colors.white,
              shape: shape),
        ));
  }
}
