import 'package:flutter/material.dart';

import '../theme/theme_handler.dart';
import 'app_list_entry.dart';

class AppListEntryExercise extends AppListEntry {
  @override
  final String entryTitle;

  @override
  final String entryDescription;

  @override
  final Color entryBackroundColor;

  @override
  final EdgeInsets entryPadding;
  final bool lastInList;
  final int maxDescriptionCharacters;
  final int maxTitleCharacters;
  final Color entryIconColor;
  final double entryIconSize;
  final IconData entryIcon;

  const AppListEntryExercise({
    required this.entryTitle,
    required this.entryDescription,
    this.lastInList = false,
    this.entryPadding = const EdgeInsets.all(10),
    this.entryBackroundColor = Colors.transparent,
    this.maxDescriptionCharacters = 200,
    this.maxTitleCharacters = 28,
    this.entryIcon = Icons.circle,
    this.entryIconColor = const Color(0xFF247A8F),
    this.entryIconSize = 12,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHandler().getTheme();
    final cutDescription = entryDescription.length >= maxDescriptionCharacters
        ? entryDescription.substring(0, maxDescriptionCharacters) + "..."
        : entryDescription;
    final cutTitle = entryTitle.length >= maxTitleCharacters
        ? entryTitle.substring(0, maxTitleCharacters) + "..."
        : entryTitle;
    return Material(
      shape: lastInList
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)))
          : null,
      color: entryBackroundColor,
      child: Padding(
        padding: entryPadding,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) =>
                      Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                entryIcon,
                                color: entryIconColor,
                                size: entryIconSize,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.75,
                            child: Text(
                              cutTitle,
                              style: theme.text!.subsubtitle,
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.15,
                            child: InkWell(
                              onTap: () {},
                              child: IconButton(
                                  splashRadius: 20,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                            ),
                          ),
                        ],
                      )),
            ),
            Text(
              cutDescription,
              style: theme.text!.body,
            )
          ],
        ),
      ),
    );
  }
}
