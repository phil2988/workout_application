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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppNavbarItem(
                        icon: Workout.workoutsIcon,
                        text: "Workouts",
                        onTapEvent: () => updatePage(0),
                        selected: selectedPageIndex == 0,
                        iconPadding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
                      ),
                      AppNavbarItem(
                        icon: Workout.exercisesIcon,
                        text: "Exercises",
                        onTapEvent: () => updatePage(1),
                        selected: selectedPageIndex == 1,
                        iconSize: 25,
                      ),
                      AppNavbarItem(
                        icon: Workout.startWorkoutIcon,
                        text: "Start Workout",
                        onTapEvent: () => updatePage(2),
                        selected: selectedPageIndex == 2,
                        iconSize: 25,
                      ),
                      AppNavbarItem(
                          icon: Workout.settingsIcon,
                          text: "Settings",
                          onTapEvent: () => updatePage(3),
                          selected: selectedPageIndex == 3,
                          iconSize: 25),
                      AppNavbarItem(
                          icon: Workout.profileIcon,
                          text: "Profile",
                          onTapEvent: () => updatePage(4),
                          selected: selectedPageIndex == 4,
                          iconSize: 25),
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
      this.iconSize = 20,
      this.itemPadding = defaultPadding,
      this.iconPadding = EdgeInsets.zero,
      Key? key})
      : super(key: key);

  final IconData icon;
  final String text;
  final bool selected;
  final VoidCallback onTapEvent;
  final double iconSize;
  final EdgeInsets itemPadding;
  final EdgeInsets iconPadding;

  @override
  build(BuildContext context) {
    return Material(
        color: primary,
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTapEvent,
          child: Padding(
            padding: itemPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: iconPadding,
                    child: Icon(icon,
                        size: iconSize,
                        color: selected ? navBarUnSelected : navBarSelected)),
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
