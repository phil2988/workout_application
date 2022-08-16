import 'package:flutter/material.dart';

import '../models/exercise.dart';

abstract class AppListEntry extends StatelessWidget {
  const AppListEntry({Key? key}) : super(key: key);

  abstract final Exercise entryExercise;
  abstract final EdgeInsets entryPadding;
  abstract final Color entryBackroundColor;
}
