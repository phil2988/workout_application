import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';

class ExerciseInfo extends StatelessWidget {
  final title;
  final description;
  final gifLocation;

  const ExerciseInfo(this.title, this.description, this.gifLocation, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: background, title: const Text("Go Back")),
        backgroundColor: background,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    title,
                    style: titleStyle,
                  ),
                )),
            const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    "Description",
                    style: subTitleStyle,
                  ),
                )),
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    description,
                    style: contentStyle,
                  ),
                )),
            Image.asset("assets/workout_gifs/" + gifLocation[0])
          ],
        )));
  }
}
