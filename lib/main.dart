import 'dart:io';
import 'package:flutter/material.dart';
import 'package:workout_application/start_workout/start_workout_page.dart';
import 'package:workout_application/workout_icons.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/workouts_page/workouts_overview_page.dart';
import 'exercises_page/exercises_overview_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      bottomNavigationBar: NavBar(),
      backgroundColor: background,
    ));
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _Navbar();
}

class _Navbar extends State<NavBar> {
  int selectedPageIndex = 0;

  List<Widget> pages = [
    const WorkoutsOverview(),
    const ExercisesOverview(),
    const StartWorkout(),
    const ExercisesOverview(),
    const ExercisesOverview()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "WorkoutApp",
        theme: ThemeData(fontFamily: "Staatliches"),
        home: Scaffold(
          body: Center(child: pages.elementAt(selectedPageIndex)),
          bottomNavigationBar: Container(
              color: primary,
              child: SizedBox(
                  height: 65,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: getChildren(),
                  ))),
        ));
  }

  List<Widget> getChildren() {
    return [
      AppNavbarItem(Workout.barbell, "Workouts", () => onItemTapped(0)),
      AppNavbarItem(Workout.pulse, "Exercises", () => onItemTapped(1)),
      AppNavbarItem(Workout.add, "Start Workout", () => onItemTapped(2)),
      AppNavbarItem(Workout.settings, "Settings", () => onItemTapped(3)),
      AppNavbarItem(Workout.user, "Profile", () => onItemTapped(4)),
    ];
  }
}

class AppNavbarItem extends StatelessWidget {
  const AppNavbarItem(this.icon, this.text, this.onTap, {Key? key})
      : super(key: key);

  final IconData icon;
  final String text;
  final void Function() onTap;

  @override
  build(BuildContext context) {
    return Material(
        color: primary,
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTap,
          child: Padding(
            padding: defaultPadding,
            child: Column(
              children: [Icon(icon, size: 25), Text(text)],
            ),
          ),
        ));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
