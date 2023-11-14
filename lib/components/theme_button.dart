// import 'dart:io';

// import 'package:csci410_project1/theme/theme_provider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ThemeButton extends StatelessWidget {
//   final Function onPressed;
//   const ThemeButton({
//     required this.onPressed,
//     Key? key,
//   }) : super(key: key);
//   // bool isDarkmode = false; // new variable

//   @override
//   Widget build(BuildContext context) {
//     ThemeProvider themeProvider = Provider.of<ThemeProvider>(
//       context,
//     );
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Container(
//         decoration: BoxDecoration(
//           color: themeProvider.systemBrightness == Brightness.light
//               ? themeProvider.white
//               : themeProvider.white,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: IconButton(
//           onPressed: () {},
//           icon: Icon(themeProvider.systemBrightness == Brightness.light
//               ? Icons.light_mode
//               : Icons.dark_mode_rounded),
//           color: themeProvider.systemBrightness == Brightness.light
//               ? themeProvider.black
//               : themeProvider.darkPrimaryColor,
//         ),
//       ),
//     );
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty<Function>('onPressed', onPressed));
//   }
// }
