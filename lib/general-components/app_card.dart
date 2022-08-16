import 'package:flutter/material.dart';
import 'package:workout_application/theme/theme_handler.dart';

class AppCard extends StatelessWidget {
  final EdgeInsets outerPadding;
  final EdgeInsets innerPadding;
  final String title;
  final String description;
  final int displayCharacters;
  final void Function() onPressed;

  final Size size;

  const AppCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.onPressed,
      this.size = const Size(380, 180),
      this.outerPadding = const EdgeInsets.all(5),
      this.innerPadding =
          const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      this.displayCharacters = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cutDescription = description.length >= displayCharacters
        ? description.substring(0, displayCharacters) + "..."
        : description;
    final theme = ThemeHandler().getTheme();
    return Padding(
        padding: outerPadding,
        child: Material(
          color: theme.color!.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: InkWell(
            child: Container(
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  shadows: const [
                    BoxShadow(
                        color: Color.fromARGB(64, 0, 0, 0),
                        blurRadius: 15,
                        blurStyle: BlurStyle.outer)
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
                            style: theme.text!.subtitle,
                          ),
                          IconButton(
                            onPressed: onPressed,
                            icon: Icon(
                              Icons.arrow_right_alt_sharp,
                              color: theme.color!.onPrimary,
                              size: 30,
                            ),
                            splashRadius: 20,
                          )
                        ],
                      ),
                      Text(
                        cutDescription,
                        style: theme.text!.body,
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
//                     child: Text(title, style: theme.text!.subtitle),
//                   )),
//               Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(cutDescription, style: theme.text!.body))
//             ],
//           ),
//           style: ElevatedButton.styleFrom(
//               textStyle: theme.textTheme.button,
//               fixedSize: Size(buttonWidth, buttonHeight),
//               primary: ThemeHandler().getTheme().color!.primary,
//               onPrimary: Colors.white,
//               shape: shape),
//         ));