import 'dart:io';

import 'package:flutter/material.dart';
import 'package:workout_application/exercises-page/exercise-info-page.dart';
import 'package:workout_application/workout_icons.dart';
import 'package:workout_application/exercises-page/exercises-overview.dart';
import 'package:workout_application/app_configs.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const AppShell());
}

class AppShell extends StatelessWidget {
  const AppShell({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int selectedPageIndex = 0;

  List<Widget> navBarWidgets = [
    const ExercisesOverview(),
    const ExercisesOverview(),
    const ExercisesOverview(),
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
        title: "workoutApp",
        theme: ThemeData(fontFamily: "Staatliches"),
        home: Scaffold(
          body: Center(
            child: navBarWidgets.elementAt(selectedPageIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Workout.barbell),
                label: "Workouts",
              ),
              BottomNavigationBarItem(
                icon: Icon(Workout.pulse),
                label: "Pulse",
              ),
              BottomNavigationBarItem(
                icon: Icon(Workout.add),
                label: "New Workout",
              ),
              BottomNavigationBarItem(
                icon: Icon(Workout.settings),
                label: "Settings",
              ),
              BottomNavigationBarItem(
                icon: Icon(Workout.user),
                label: "Profile",
              ),
            ],
            currentIndex: selectedPageIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: primary,
            selectedItemColor: navBarSelected,
            unselectedItemColor: navBarUnSelected,
            onTap: onItemTapped,
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
