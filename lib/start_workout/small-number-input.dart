import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';

class SmallNumberInput extends StatelessWidget {
  const SmallNumberInput(
      {Key? key,
      this.height = 50,
      this.width = 50,
      this.suffix = "",
      this.text = ""})
      : super(key: key);

  final double height;
  final double width;
  final String suffix;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (text != "") Text(text, style: buttonStyle),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: height,
              width: width,
              child: TextFormField(
                  style: inputNumberStyle,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: getInputDecoration()),
            )
          ],
        )
      ],
    );
  }

  InputDecoration getInputDecoration() {
    if (suffix != "") {
      return const InputDecoration(
          suffixText: 'Kg',
          suffixStyle: TextStyle(color: Colors.white, fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)));
    }
    return const InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
  }
}
