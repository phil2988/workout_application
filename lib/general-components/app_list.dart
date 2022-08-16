import 'package:flutter/material.dart';
import 'package:workout_application/theme/theme_handler.dart';

import 'app_list_entry.dart';

class AppList extends StatelessWidget {
  final String listTitle;
  final EdgeInsets titlePadding;
  final EdgeInsets outerPadding;
  final EdgeInsets entryPadding;

  final List<AppListEntry> listEntries;

  const AppList({
    required this.listEntries,
    this.listTitle = "",
    this.titlePadding = const EdgeInsets.fromLTRB(25, 25, 25, 10),
    this.entryPadding = const EdgeInsets.fromLTRB(30, 10, 30, 30),
    this.outerPadding = const EdgeInsets.all(20.0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();
    return Padding(
        padding: outerPadding,
        child: Container(
          decoration: ShapeDecoration(
              color: theme.color!.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              shadows: const [
                BoxShadow(
                    color: Color.fromARGB(64, 0, 0, 0),
                    blurRadius: 15,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            children: [
              Column(
                children: [
                  if (listTitle != "")
                    Padding(
                      padding: titlePadding,
                      child: Column(
                        children: [
                          Text(
                            "Exercises in this workout",
                            style: theme.text!.subtitle,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: 50,
                              height: 2,
                              child: Container(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              ...listEntries
            ],
          ),
        ));
  }
}
