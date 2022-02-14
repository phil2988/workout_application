import 'package:flutter/material.dart';

class Workouts extends StatelessWidget {
  Workouts({Key? key}) : super(key: key);

  static const TextStyle titleStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle subTitleStyle = TextStyle(fontSize: 23);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color(0xFF73D493),
          alignment: Alignment.center,
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
              const Text("Choose A Workout", style: titleStyle),
              const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
              const Text("Squat", style: subTitleStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 0, 0))))),
                      onPressed: () => debugPrint("Hello"),
                      child: const Text("HELLO")),
                  OutlinedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 0, 0))))),
                      onPressed: () => debugPrint("Hello"),
                      child: const Text("HELLO"))
                ],
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
              const Text("Bænkpres", style: subTitleStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 0, 0))))),
                      onPressed: () => debugPrint("Hello"),
                      child: const Text("HELLO")),
                  OutlinedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 0, 0))))),
                      onPressed: () => debugPrint("Hello"),
                      child: const Text("HELLO"))
                ],
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
              const Text("Dødløft", style: subTitleStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 0, 0))))),
                      onPressed: () => debugPrint("Hello"),
                      child: const Text("HELLO")),
                  OutlinedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 0, 0))))),
                      onPressed: () => debugPrint("Hello"),
                      child: const Text("HELLO"))
                ],
              ),
            ],
          )),
    );
  }
}
