import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/start_workout/start_workout_page.dart';
import 'package:workout_application/workout_icons.dart';
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
    final theme = ThemeHandler().getTheme();
    return MaterialApp(
        title: "WorkoutApp",
        home: Scaffold(
          body: Center(child: _pages.elementAt(selectedPageIndex)),
          bottomNavigationBar: Container(
              color: theme.bottomNavigationBarTheme.backgroundColor,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  getNavbarItems() {
                    List<Widget> navbarItems = [];
                    for (var i = 0; i < 5; i++) {
                      navbarItems.add(SizedBox(
                        width: selectedPageIndex == i
                            ? constraints.maxWidth * 0.28
                            : constraints.maxWidth * 0.18,
                        child: AppNavbarItem(
                            icon: icons[i],
                            text: text[i],
                            onTapEvent: () => updatePage(i),
                            selected: i == selectedPageIndex,
                            unselectedIconSize: i == 2
                                ? theme.bottomNavigationBarTheme
                                        .unselectedIconTheme!.size! +
                                    10
                                : theme.bottomNavigationBarTheme
                                    .unselectedIconTheme!.size,
                            selectedIconSize: i == 2
                                ? theme.bottomNavigationBarTheme
                                        .unselectedIconTheme!.size! +
                                    7
                                : theme.bottomNavigationBarTheme
                                    .unselectedIconTheme!.size,
                            iconPadding: i == 0
                                ? const EdgeInsets.only(right: 15)
                                : const EdgeInsets.all(0)),
                      ));
                    }
                    return navbarItems;
                  }

                  return SizedBox(
                      height: ThemeHandler()
                          .getTheme()
                          .bottomNavigationBarTheme
                          .elevation,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: getNavbarItems(),
                      ));
                },
              )),
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
    this.selected = false,
    this.itemPadding = defaultPadding,
    this.iconPadding = EdgeInsets.zero,
    Key? key,
    this.selectedIconSize,
    this.unselectedIconSize,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final bool selected;

  final VoidCallback onTapEvent;
  final EdgeInsets itemPadding;
  final EdgeInsets iconPadding;

  final double? selectedIconSize;
  final double? unselectedIconSize;

  @override
  build(BuildContext context) {
    final theme = ThemeHandler().getTheme();
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
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: iconPadding,
                    child: Icon(icon,
                        size: selected
                            ? selectedIconSize ??
                                theme.bottomNavigationBarTheme
                                    .selectedIconTheme!.size
                            : unselectedIconSize ??
                                theme.bottomNavigationBarTheme
                                    .unselectedIconTheme!.size,
                        color: selected
                            ? theme.bottomNavigationBarTheme.selectedIconTheme!
                                .color
                            : theme.bottomNavigationBarTheme
                                .unselectedIconTheme!.color),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      text,
                      style: selected
                          ? theme.bottomNavigationBarTheme.selectedLabelStyle
                          : theme.bottomNavigationBarTheme.unselectedLabelStyle,
                      textAlign: TextAlign.end,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
