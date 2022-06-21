import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({
    Key? key,
    required this.title, 
    required this.description, 
    required this.imageUrl
    }) : super(key: key);

  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar:
            AppBar(backgroundColor: background, title: const Text("Go Back")),
        body: SingleChildScrollView(
            child: Padding(
                padding: defaultPadding,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        title,
                        style: titleStyle,
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          "Description",
                          style: subTitleStyle,
                        ),
                      )
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          description,
                          style: contentStyle,
                        ),
                      )
                    ),
                    const SizedBox(width: double.infinity,
                      child: Text("Muscle Groups", style: subTitleStyle,)
                    ),
                    SizedBox(
                      width: double.infinity,
                      // TODO: Rewrite temp code
                      child: Image.network(storrageAccountUrl + "images/" + imageUrl == "" ? "big-guns.jpg" : "") ,
                    )
                  ],
                ))));
  }
}
