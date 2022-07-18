import 'package:flutter/material.dart';
import 'package:workout_application/theme/app_themes.dart';
import '../app_configs.dart';

class AppCard extends StatelessWidget {
  final EdgeInsets outerPadding;
  final EdgeInsets innerPadding;
  final String title;
  final String description;
  final void Function() onPressed;

  final Size size;

  const AppCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onPressed,
    this.size = const Size(380, 150),
    this.outerPadding = const EdgeInsets.all(5),
    this.innerPadding = const EdgeInsets.all(15),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cutDescription = description.length >= 100
        ? description.substring(0, 100) + "..."
        : description;
    final theme = ThemeHandler().getTheme();
    return Padding(
        padding: outerPadding,
        child: Material(
          color: theme.colorScheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: InkWell(
            child: Container(
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  shadows: const [
                    BoxShadow(blurRadius: 5, blurStyle: BlurStyle.outer)
                  ]),
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Padding(
                  padding: innerPadding,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: theme.textTheme.subtitle1,
                          ),
                          IconButton(
                            onPressed: onPressed,
                            icon: Icon(
                              Icons.arrow_right_alt_sharp,
                              color: theme.colorScheme.onPrimary,
                              size: 30,
                            ),
                            splashRadius: 20,
                          )
                        ],
                      ),
                      Text(
                        cutDescription,
                        style: theme.textTheme.bodyText1,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}


// Padding(
//         padding: defaultPadding,
//         child: ElevatedButton(
//           onPressed: onPressed,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(title, style: theme.textTheme.subtitle1),
//                   )),
//               Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(cutDescription, style: theme.textTheme.bodyText1))
//             ],
//           ),
//           style: ElevatedButton.styleFrom(
//               textStyle: theme.textTheme.button,
//               fixedSize: Size(buttonWidth, buttonHeight),
//               primary: ThemeHandler().getTheme().colorScheme.primary,
//               onPrimary: Colors.white,
//               shape: shape),
//         ));