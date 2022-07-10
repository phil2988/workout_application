import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/theme/app_themes.dart';

class SmallNumberInput extends StatelessWidget {
  const SmallNumberInput(
      {required this.controller,
      this.height = 50,
      this.width = 50,
      this.suffix = "",
      this.text = "",
      Key? key})
      : super(key: key);

  final double height;
  final double width;
  final String suffix;
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();

    InputDecoration getInputDecoration() {
      if (suffix != "") {
        return const InputDecoration(
            suffixText: 'Kg',
            suffixStyle: TextStyle(color: Colors.white, fontSize: 20),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)));
      }
      return const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)));
    }

    return Column(
      children: [
        if (text != "") Text(text, style: theme.textTheme.button),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: height,
              width: width,
              child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"^[0-9]*$"))
                  ],
                  controller: controller,
                  style: theme.textTheme.headline4,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: getInputDecoration()),
            )
          ],
        )
      ],
    );
  }
}

extension ExtString on String {
  bool get isNumeric {
    return !double.parse(this).isNaN;
  }
}
