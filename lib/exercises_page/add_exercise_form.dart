import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general-components/app_button.dart';
import 'package:workout_application/general_functions/backend_submits.dart';
import 'package:workout_application/theme/theme_handler.dart';

import '../general_functions/backend_fetches.dart';
import '../general_functions/futurebuilder_builder.dart';
import '../general_functions/utility.dart';
import '../models/exercise.dart';

class AddExerciseForm extends StatefulWidget {
  const AddExerciseForm({Key? key}) : super(key: key);

  @override
  AddExerciseFormState createState() => AddExerciseFormState();
}

class AddExerciseFormState extends State<AddExerciseForm> {
  final formKey = GlobalKey<FormState>();
  String variationDropdownValue = "Choose one...";
  String categoryDropdownValue = "Choose one...";
  String titleTextValue = "";
  String descriptionTextValue = "";

  bool titleError = false;
  bool descriptionError = false;
  bool variationError = false;
  bool categoryError = false;

  late Future variationDropDownFuture = getVariationDropdownButton();
  late Future categoriesDropDownFuture = getCategoryDropdownButton();

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();
    return Form(
        key: formKey,
        child: Padding(
          padding: defaultPadding,
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(child:
                LayoutBuilder(builder: (context, BoxConstraints constraints) {
              return Column(mainAxisSize: MainAxisSize.max, children: [
                Text(
                  "Add New Exercise",
                  style: theme.text!.title,
                ),
                getTextFormField("title"),
                getTextFormField("description"),
                getVariationField(constraints.maxWidth),
                getCategoryField(constraints.maxWidth),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppButton(
                    buttonText: "Add Exercise",
                    onPressed: () {
                      if (formKey.currentState!.validate()) onSubmit();
                    },
                    buttonHeight: 50,
                    buttonWidth: 180,
                  ),
                )
              ]);
            })),
          ),
        ));
  }

  getCategoryField(double width) {
    final theme = ThemeHandler().getTheme();
    return FutureBuilder(
        future: categoriesDropDownFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return getFutureBuilderErrorHandling(
              snapshot: snapshot,
              returnWidget: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: width * 0.3,
                          child: Text(
                            "Category",
                            style: categoryError
                                ? theme.text!.subsubtitle
                                : theme.text!.subsubtitleError,
                          )),
                      SizedBox(
                        child: snapshot.data,
                        width: width * 0.7,
                      ),
                    ],
                  ),
                  Divider(
                      color: categoryError
                          ? theme.color!.error
                          : theme.color!.onBackground,
                      thickness: 1),
                ],
              ));
        });
  }

  Future getCategoryDropdownButton() async {
    final theme = ThemeHandler().getTheme();
    final exercises = await getExercises();
    List<String> categories =
        ["Choose one..."] + getUniqueCategoriesWithExercises(exercises);

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: ThemeHandler().getTheme().color!.primary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        errorStyle: const TextStyle(
          height: 0,
          color: Colors.transparent,
          fontSize: 0,
        ),
      ),
      dropdownColor: ThemeHandler().getTheme().color!.primary,
      value: categoryDropdownValue,
      style: theme.text!.body,
      onChanged: (String? newValue) {
        setState(() {
          categoryDropdownValue = newValue ?? "";
        });
      },
      validator: (value) {
        if (value == "Choose one...") {
          setState(() {
            categoryError = true;
          });
          return "";
        }
        setState(() {
          categoryError = false;
        });
        return null;
      },
      items: categories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: theme.text!.body,
          ),
        );
      }).toList(),
    );
  }

  getVariationField(double width) {
    final theme = ThemeHandler().getTheme();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: FutureBuilder(
          future: variationDropDownFuture,
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Container(
                  child: Text(
                    "Error! No Connection!",
                    style: theme.text!.subsubtitle,
                  ),
                  alignment: Alignment.topCenter,
                  color: theme.color!.background,
                );
              case ConnectionState.waiting:
                return Container(
                  child: Text(
                    "Loading...",
                    style: theme.text!.subsubtitle,
                  ),
                  alignment: Alignment.topCenter,
                  color: theme.color!.background,
                );
              default:
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else {
                  return Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: width * 0.3,
                              child: Text("Variation",
                                  style: variationError
                                      ? theme.text!.subtitle
                                      : theme.text!.subtitle)),
                          SizedBox(
                            child: snapshot.data,
                            width: width * 0.7,
                          ),
                        ],
                      ),
                      Divider(
                          color: variationError
                              ? theme.color!.error
                              : theme.color!.onBackground,
                          thickness: 1),
                    ],
                  );
                }
            }
          }),
    );
  }

  Future getVariationDropdownButton() async {
    List<String> parentExercises = ["Choose one...", "Not a variation"];

    final exercises = await getExercises();

    for (var exercise in exercises) {
      {
        if (!parentExercises.contains(exercise.title) &&
            exercise.parentExercise == "") {
          parentExercises.add(exercise.title);
        }
      }
    }

    final theme = ThemeHandler().getTheme();
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: ThemeHandler().getTheme().color!.primary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        errorStyle: const TextStyle(
          height: 0,
          color: Colors.transparent,
          fontSize: 0,
        ),
      ),
      dropdownColor: ThemeHandler().getTheme().color!.primary,
      value: variationDropdownValue,
      style: theme.text!.body,
      onChanged: (String? newValue) {
        setState(() {
          variationDropdownValue = newValue ?? "";
        });
      },
      validator: (value) {
        if (value == "Choose one...") {
          setState(() {
            variationError = true;
          });
          return "";
        }
        setState(() {
          variationError = false;
        });
        return null;
      },
      items: parentExercises.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: theme.text!.body),
        );
      }).toList(),
    );
  }

  getTextFormField(String hint) {
    final theme = ThemeHandler().getTheme();

    return TextFormField(
      maxLines: hint.toLowerCase() == "description" ? 5 : 1,
      style: theme.text!.subsubtitle,
      decoration: InputDecoration(
        hintStyle: getErrorOrNormalTextFormField(hint),
        hintText: hint,
        border: const UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: getErrorOrNormalColorFormField(hint))),
        enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: getErrorOrNormalColorFormField(hint))),
        errorStyle: const TextStyle(
          height: 0,
          color: Colors.transparent,
          fontSize: 0,
        ),
      ),
      initialValue:
          hint.toLowerCase() == "title" ? titleTextValue : descriptionTextValue,
      onChanged: (value) {
        if (hint.toLowerCase() == "title") {
          setState(() {
            titleTextValue = value;
          });
        }
        if (hint.toLowerCase() == "description") {
          setState(() {
            descriptionTextValue = value;
          });
        }
      },
      validator: (value) {
        if (hint.toLowerCase() == "title") {
          if (value == null || value.isEmpty) {
            setState(() {
              titleError = true;
            });
            return "";
          }
          titleError = false;
        }
        if (hint.toLowerCase() == "description") {
          if (value == null || value.isEmpty) {
            setState(() {
              descriptionError = true;
            });
            return "";
          }
          descriptionError = false;
        }
        return null;
      },
    );
  }

  getErrorOrNormalTextFormField(String hint) =>
      (hint.toLowerCase() == "title" && titleError) ||
              (hint.toLowerCase() == "description" && descriptionError)
          ? ThemeHandler().defaultTheme.text!.subtitle
          : ThemeHandler().defaultTheme.text!.subtitleError;

  getErrorOrNormalColorFormField(String hint) =>
      (hint.toLowerCase() == "title" && titleError) ||
              (hint.toLowerCase() == "description" && descriptionError)
          ? Colors.red
          : Colors.white;

  onSubmit() async {
    final exercise = Exercise(
        title: titleTextValue,
        description: descriptionTextValue,
        category: categoryDropdownValue,
        parentExercise: variationDropdownValue != "Not a variation"
            ? variationDropdownValue
            : "",
        images: "");

    final result = await submitNewExercise(exercise);

    if (result == 200) log("Success!");
    Navigator.pop(context);
  }
}
