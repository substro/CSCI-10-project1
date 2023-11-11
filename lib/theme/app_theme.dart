import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeClass {
  //this is the light theme background
  Color lightPrimaryColor = HexColor("F5F5F5");
  // this is the dark theme background
  Color darkPrimaryColor = HexColor("030320");
  Color lightSecondaryColor = HexColor("FFFFFF");
  Color darkSecondaryColor = HexColor("1A2148");
  Color accentColor = HexColor("575DE3");

  static ThemeData lightTheme = ThemeData(
    primaryColor: _themeClass.lightPrimaryColor,
    scaffoldBackgroundColor: _themeClass.lightPrimaryColor,
    colorScheme: const ColorScheme.light()
        .copyWith(
          primary: _themeClass.lightPrimaryColor,
          secondary: _themeClass.lightSecondaryColor,
        )
        .copyWith(secondary: _themeClass.accentColor),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            fontFamily: 'Electrolize',
            fontSize: 35,
            color: HexColor("FFFFFF"))),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: _themeClass.darkPrimaryColor,
    scaffoldBackgroundColor: _themeClass.darkPrimaryColor,
    colorScheme: const ColorScheme.dark()
        .copyWith(
          primary: _themeClass.darkPrimaryColor,
          secondary: _themeClass.darkSecondaryColor,
        )
        .copyWith(secondary: _themeClass.accentColor),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            fontFamily: 'Electrolize',
            fontSize: 35,
            color: HexColor("FFFFFF"))),
  );
}

ThemeClass _themeClass = ThemeClass();
