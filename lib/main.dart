import 'dart:io';
import 'package:flutter/material.dart';
import 'package:workout_application/start_workout/start_workout_page.dart';
import 'package:workout_application/workout_icons.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/workouts_page/workouts_overview_page.dart';
import 'exercises_page/exercises_overview_page.dart';
import 'package:event/event.dart';

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
  State<NavBar> createState() => _NavbarState();
}

final List<Widget> _pages = [
  const WorkoutsOverview(),
  const ExercisesOverview(),
  const StartWorkout(),
  const ExercisesOverview(),
  const ExercisesOverview()
];

class _NavbarState extends State<NavBar> {
  int selectedPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "WorkoutApp",
        theme: ThemeData(fontFamily: "Staatliches"),
        home: Scaffold(
          body: Center(child: _pages.elementAt(selectedPageIndex)),
          bottomNavigationBar: Container(
              color: primary,
              child: SizedBox(
                  height: 65,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppNavbarItem(
                          icon: Workout.barbell,
                          text: "Workouts",
                          onTapEvent: () => updatePage(0),
                          selected: selectedPageIndex == 0),
                      AppNavbarItem(
                          icon: Workout.pulse,
                          text: "Exercises",
                          onTapEvent: () => updatePage(1),
                          selected: selectedPageIndex == 1),
                      AppNavbarItem(
                          icon: Workout.add,
                          text: "Start Workout",
                          onTapEvent: () => updatePage(2),
                          selected: selectedPageIndex == 2),
                      AppNavbarItem(
                          icon: Workout.settings,
                          text: "Settings",
                          onTapEvent: () => updatePage(3),
                          selected: selectedPageIndex == 3),
                      AppNavbarItem(
                          icon: Workout.user,
                          text: "Profile",
                          onTapEvent: () => updatePage(4),
                          selected: selectedPageIndex == 4),
                    ],
                  ))),
        ));
  }

  void updatePage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }
}

class AppNavbarItem extends StatelessWidget {
  const AppNavbarItem(
      {required this.icon,
      required this.text,
      required this.onTapEvent,
      required this.selected,
      Key? key})
      : super(key: key);

  final IconData icon;
  final String text;
  final bool selected;
  final VoidCallback onTapEvent;

  @override
  build(BuildContext context) {
    return Material(
        color: primary,
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTapEvent,
          child: Padding(
            padding: defaultPadding,
            child: Column(
              children: [
                Icon(icon,
                    size: 25,
                    color: selected ? navBarUnSelected : navBarSelected),
                Text(
                  text,
                  style: TextStyle(
                      color: selected ? navBarUnSelected : navBarSelected),
                )
              ],
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
