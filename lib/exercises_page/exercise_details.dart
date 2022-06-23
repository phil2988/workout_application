import 'package:accordion/accordion.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';

import '../general_functions/utility.dart';

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
                    getTitleAndDescription(title, description),
                    getMuscleGroupSection(imageUrl),
                    getVariationsSection(),
                  ],
                ))));
  }
  
  getVariationsSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        width: double.infinity,
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
              iconColor: Colors.white 
          ),
          header: const Text(
            "Exercise Variations", 
            style: subTitleStyle),
          collapsed: Container(), 
          expanded:ScrollOnExpand(
            child: Accordion(
            headerBackgroundColor: primary,
            maxOpenSections: 1,
            children: [
              getVariationAccordionSection("Incline Benchpress", "Raise the bench to an incline to get a better focus on the upper chest"),
              getVariationAccordionSection("Decline Benchpress", "Lower the bench to a decline to get a better focus on the lower chest"),
              getVariationAccordionSection("Flat Benchpress", "Lay flat on the ground with flared elbows to focus the triceps")
            ]
          ), 
          ) 
        )
      ),
    );
  }
  
  getTitleAndDescription(String title, String description){
    return 
        Column(
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
                padding: EdgeInsets.only(bottom: 10),
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
          ],
    );
  }

  getMuscleGroupSection(String url){
    return Column(
      children: [
          const SizedBox(width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("Muscle Groups", style: subTitleStyle,),
          )
        ),
        SizedBox(
          width: double.infinity,
          child: Image.network(getImageUrl(exerciseUrl: url)) ,
        )
      ],
    );
  }

  getVariationAccordionSection(String title, String description){
    return AccordionSection(
      header: Text(
        title, 
        style: subTitleStyle
        ),
      content: Align(
            alignment: Alignment.topLeft,
            child: Text(
              description, 
              style: accordionContentStyle)) 
    );
  }

}
