import 'package:flutter/material.dart';

abstract class AppListEntry extends StatelessWidget {
  const AppListEntry({Key? key}) : super(key: key);

  abstract final String entryTitle;
  abstract final String entryDescription;
  abstract final EdgeInsets entryPadding;
  abstract final Color entryBackroundColor;
}
