import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_application/start_workout/start_workout_page.dart';
import 'package:workout_application/workout_icons.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/workouts_page/workouts_overview_page.dart';
import 'exercises_page/exercises_overview_page.dart';
import 'theme/app_themes.dart';

void main() {
  // HttpOverrides.global = MyHttpOverrides();
  return runApp(ChangeNotifierProvider<ThemeHandler>(
    create: (_) => ThemeHandler(),
    child: const RootWidget(),
  ));
}

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RootWidgetState();
}

class RootWidgetState extends State<RootWidget> {
  final themeHandler = ThemeHandler();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeHandler.defaultTheme,
        home: Scaffold(
          bottomNavigationBar: const NavBar(),
          backgroundColor: Theme.of(context).backgroundColor,
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

final List<IconData> icons = [
  Workout.workoutsIcon,
  Workout.exercisesIcon,
  Workout.startWorkoutIcon,
  Workout.settingsIcon,
  Workout.profileIcon,
];

final List<String> text = [
  "Workouts",
  "Exercises",
  "Start Workout",
  "Settings",
  "Profile",
];

class _NavbarState extends State<NavBar> {
  int selectedPageIndex = 2;

  @override
  Widget build(context) {
    getNavbarItems() {
      List<AppNavbarItem> navbarItems = [];
      for (var i = 0; i < 5; i++) {
        navbarItems.add(AppNavbarItem(
          icon: icons[i],
          text: text[i],
          onTapEvent: () => updatePage(i),
          selected: i == selectedPageIndex,
          selectedIconStyle:
              Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
          unSelectedIconStyle:
              Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
          selectedTextStyle:
              Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
          unSelectedTextStyle:
              Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle,
        ));
      }
      return navbarItems;
    }

    return MaterialApp(
        title: "WorkoutApp",
        home: Scaffold(
          body: Center(child: _pages.elementAt(selectedPageIndex)),
          bottomNavigationBar: Container(
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              child: SizedBox(
                  height: Theme.of(context).bottomNavigationBarTheme.elevation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: getNavbarItems(),
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
  const AppNavbarItem({
    required this.icon,
    required this.text,
    required this.onTapEvent,
    required this.selectedIconStyle,
    required this.selectedTextStyle,
    required this.unSelectedIconStyle,
    required this.unSelectedTextStyle,
    this.selected = false,
    this.itemPadding = defaultPadding,
    this.iconPadding = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final bool selected;

  final VoidCallback onTapEvent;
  final EdgeInsets itemPadding;
  final EdgeInsets iconPadding;

  final TextStyle? selectedTextStyle;
  final TextStyle? unSelectedTextStyle;

  final IconThemeData? selectedIconStyle;
  final IconThemeData? unSelectedIconStyle;

  @override
  build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTapEvent,
          child: Padding(
            padding: itemPadding,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(icon,
                    size: selected
                        ? selectedIconStyle?.size
                        : unSelectedIconStyle?.size,
                    color: selected
                        ? selectedIconStyle?.color
                        : unSelectedIconStyle?.color),
                Text(
                  text,
                  style: selected ? selectedTextStyle : unSelectedTextStyle,
                )
              ],
            ),
          ),
        ));
  }
}
