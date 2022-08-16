import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:workout_application/app_configs.dart';
import 'package:workout_application/start_workout/start_workout_page.dart';
import 'package:workout_application/workout_icons.dart';
import 'package:workout_application/workouts_page/workouts_overview_page.dart';

import 'exercises_page/exercises_overview_page.dart';
import 'theme/theme_handler.dart';

void main() {
  // HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);

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
              color: theme.navbar!.background,
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
                            // We need to have middle icon be bigger -> i == 2
                            unselectedIconSize: i == 2
                                ? theme.navbar!.unselectedIcon!.size! + 10
                                : theme.navbar!.unselectedIcon!.size,
                            selectedIconSize: i == 2
                                ? theme.navbar!.unselectedIcon!.size! + 7
                                : theme.navbar!.unselectedIcon!.size,
                            // First icon needs a little padding
                            iconPadding: i == 0
                                ? const EdgeInsets.only(right: 15)
                                : const EdgeInsets.all(0)),
                      ));
                    }
                    return navbarItems;
                  }

                  return SizedBox(
                      height: ThemeHandler().getTheme().navbar!.height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
    this.itemPadding = const EdgeInsets.only(bottom: 12),
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
                                theme.navbar!.selectedIcon!.size
                            : unselectedIconSize ??
                                theme.navbar!.unselectedIcon!.size,
                        color: selected
                            ? theme.navbar!.selectedIcon!.color
                            : theme.navbar!.selectedIcon!.color),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      text,
                      style: selected
                          ? theme.navbar!.selectedText
                          : theme.navbar!.unselectedText,
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
