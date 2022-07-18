import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final TextStyle fontStyle;
  final String text;

  const SubtitleText({required this.text, required this.fontStyle, Key? key})
      : super(key: key);

  @override
  build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: fontStyle,
          ),
          const Material(
            color: Colors.white,
            child: SizedBox(
              height: 2,
              width: 50,
            ),
          )
        ],
      ),
    );
  }
}
