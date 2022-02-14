import 'package:flutter/material.dart';
import 'package:workout_application/workout_icons.dart';
import 'package:workout_application/workouts.dart';

void main() => runApp(const AppShell());

class AppShell extends StatelessWidget {
  const AppShell({Key? key}) : super(key: key);

  static const String title = "Workout Application";

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: title, home: NavBar());
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int selectedPageIndex = 0;

  //static Workouts widget_workout;

  // static const TextStyle fontStyle =
  //    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> navBarWidgets = <Widget>[
    Workouts("widget1"),
    Workouts("widget2"),
    Workouts("widget3"),
    Workouts("widget4"),
    Workouts("widget5"),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout Application"),
      ),
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
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.black87,
        onTap: onItemTapped,
      ),
    );
  }
}
