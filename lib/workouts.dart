import 'package:flutter/material.dart';

class Workouts extends StatelessWidget {
  const Workouts(String text, {Key? key})
      : assert(text != ""),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello from workouts"),
      ),
    );
  }
}
