import 'package:flutter/material.dart';
import '../app_configs.dart';

class AppCard extends StatelessWidget {
  AppCard(this.title, this.description, this.onPressed,
      {Key? key,
      this.textStyle = buttonStyle,
      this.buttonWidth = double.maxFinite,
      this.buttonHeight = 150,
      this.shape = const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(15)))})
      : super(key: key);

  final String title;
  String description;
  final void Function() onPressed;
  final double buttonWidth;
  final double buttonHeight;
  final OutlinedBorder shape;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    if (description.length >= 100) {
      description = description.substring(0, 100) + "...";
    }

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
                  child: Text(description, style: contentStyle))
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
