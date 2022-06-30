import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/general-components/app_button.dart';
import 'package:workout_application/general_functions/backend_submits.dart';

import '../general_functions/backend_fetches.dart';
import '../general_functions/utility.dart';
import '../models/exercise.dart';

class AddExerciseForm extends StatefulWidget{
  const AddExerciseForm({
    Key? key
  }) : super(key: key);

  @override 
  AddExerciseFormState createState() => AddExerciseFormState();
}

class AddExerciseFormState extends State<AddExerciseForm>{

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
  Widget build(BuildContext context)
  {
    return Form(
      key: formKey,
      child: Padding(
        padding: defaultPadding,
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: LayoutBuilder(builder: (context, BoxConstraints constraints){
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text("Add New Exercise", style: titleStyle,),
                  getTextFormField("title"),
                  getTextFormField("description"), 
                  getVariationField(constraints.maxWidth),
                  getCategoryField(constraints.maxWidth),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: AppButton(buttonText: "Add Exercise", onPressed: () {
                      if (formKey.currentState!.validate()) onSubmit();
                    },
                    buttonHeight: 50,
                    buttonWidth: 180,
                    ),
                  )
                ]
              );
            })             
          ),
        ),
      ) 
    );  
  }

  getCategoryField(double width){
    return FutureBuilder(
      future: categoriesDropDownFuture,  
      builder: (context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Container(
              child: const Text(
                "Error! No Connection!",
                style: subTitleStyle,
              ),
              alignment: Alignment.topCenter,
              color: background,
            );
          case ConnectionState.waiting:
            return Container(
              child: const Text(
                "Loading...",
                style: subTitleStyle,
              ),
              alignment: Alignment.topCenter,
              color: background,
            );
          default:
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } 
            else {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.3,
                        child: Text("Category", style: categoryError ? subTitleStyleError : subTitleStyle,)),
                      SizedBox(
                        child: snapshot.data,
                        width: width * 0.7,
                      ),
                    ],
                  ),
                  Divider(color: categoryError ? Colors.red : Colors.white, thickness: 1),
                ],
              ) ;
            }
        }
      } 
    );
  }

  Future getCategoryDropdownButton() async {
    final exercises = await getExercises();
    List<String> categories = ["Choose one..."] + getUniqueCategoriesWithExercises(exercises);

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: primary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        errorStyle: const TextStyle(
          height: 0,
          color: Colors.transparent,
          fontSize: 0,         ),
      ),
      dropdownColor: primary,
      value: categoryDropdownValue,
      style: contentStyle,
      onChanged: (String? newValue) {
        setState(() {
          categoryDropdownValue = newValue ?? "";
        });
      },
      validator: (value){
        if(value == "Choose one..." || value!.isEmpty) {
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
      items: categories
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: contentStyle,),
        );
        }).toList(),      
    );
  }

  getVariationField(double width){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: FutureBuilder(
        future: variationDropDownFuture,  
        builder: (context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container(
                child: const Text(
                  "Error! No Connection!",
                  style: subTitleStyle,
                ),
                alignment: Alignment.topCenter,
                color: background,
              );
            case ConnectionState.waiting:
              return Container(
                child: const Text(
                  "Loading...",
                  style: subTitleStyle,
                ),
                alignment: Alignment.topCenter,
                color: background,
              );
            default:
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } 
              else {
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.3,
                          child: Text("Variation", style: variationError ? subTitleStyleError : subTitleStyle,)),
                        SizedBox(
                          child: snapshot.data,
                          width: width * 0.7,
                        ),
                      ],
                    ),
                    Divider(color: variationError ? Colors.red : Colors.white, thickness: 1),
                  ],
                ) ;
              }
          }
        } 
      ),
    );
  }

  Future getVariationDropdownButton() async {
    List<String> parentExercises = ["Choose one...", "Not a variation"];
    
    final exercises = await getExercises();

    for (var exercise in exercises) {
      {
        if(!parentExercises.contains(exercise.title) && exercise.parentExercise == ""){
          parentExercises.add(exercise.title);
        }
      }
    }
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: primary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      errorStyle: const TextStyle(
          height: 0,
          color: Colors.transparent,
          fontSize: 0,         ),
      ),
      dropdownColor: primary,
      value: variationDropdownValue,
      style: contentStyle,
      onChanged: (String? newValue) {
        setState(() {
          variationDropdownValue = newValue ?? "";
        });
      },
      validator: (value){
        if (value == "Choose one..." || value!.isEmpty) {
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
      items: parentExercises
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: contentStyle),
        );
        }).toList(),      
    );
  }

  getTextFormField(String hint){
    return TextFormField(
      maxLines: hint.toLowerCase() == "description" ? 5 : 1,
      style: inputNumberStyle,
      decoration: InputDecoration(
        hintStyle: getErrorOrNormalTextFormField(hint),
        hintText: hint,
        border: const UnderlineInputBorder(),
        focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: getErrorOrNormalColorFormField(hint))),
        enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: getErrorOrNormalColorFormField(hint))),
        errorStyle: const TextStyle(
          height: 0,
          color: Colors.transparent,
          fontSize: 0,         ),
        ),
        initialValue: hint.toLowerCase() == "title" ? titleTextValue : descriptionTextValue,
        onChanged: (value) {
          if(hint.toLowerCase() == "title"){          
            setState(() {
              titleTextValue = value;            
            });
          }
          if(hint.toLowerCase() == "description"){
            setState(() {
              descriptionTextValue = value;
            });
          }
        },
      validator: (value){
        if(hint.toLowerCase() == "title"){
          if (value == null || value.isEmpty) {
            log("Got Title Error");
            setState(() {
              titleError = true;            
            });
            return "";
          }
          titleError = false;
        }
        if(hint.toLowerCase() == "description"){
          log("Got description");
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

  getErrorOrNormalTextFormField(String hint) => (hint.toLowerCase() == "title" && titleError) || (hint.toLowerCase() == "description" && descriptionError) ? subTitleStyleError : subTitleStyle;

  getErrorOrNormalColorFormField(String hint) => (hint.toLowerCase() == "title" && titleError) || (hint.toLowerCase() == "description" && descriptionError) ? Colors.red : Colors.white;

  onSubmit() async {
    final exercise = Exercise(
      title: titleTextValue, 
      description: descriptionTextValue,
      category: categoryDropdownValue,
      parentExercise: variationDropdownValue != "Not a variation" ? variationDropdownValue : "",
      images: "");
    
    final result = await submitNewExercise(exercise);

    if(result == 200) log("Success!");
    Navigator.pop(context);
  }
}