import 'package:csci410_project1/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeButton extends StatelessWidget {
  Function onPressed;
  ThemeButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeClass themeClass = ThemeClass();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? themeClass.black
              : themeClass.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Theme.of(context).brightness == Brightness.light
              ? Icons.sunny
              : Icons.nightlight_sharp),
          color: Theme.of(context).brightness == Brightness.light
              ? themeClass.lightPrimaryColor
              : themeClass.darkPrimaryColor,
        ),
      ),
    );
  }
}
