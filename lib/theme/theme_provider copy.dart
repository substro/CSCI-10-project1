import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? currentTheme;

  //this is the light theme background
  Color black = HexColor("000000");
  Color white = HexColor("FFFFFF");
  Color lightPrimaryColor = HexColor("F5F5F5");
  // this is the dark theme background
  Color darkPrimaryColor = HexColor("030320");
  Color lightSecondaryColor = HexColor("FFFFFF");
  Color darkSecondaryColor = HexColor("1A2148");
  Color accentColor = HexColor("575DE3");

  Brightness get systemBrightness =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  void themeProvider() {
    // Initialize currentTheme based on system theme
    Brightness systemBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (systemBrightness == Brightness.light) {
      setLightMode();
    } else {
      setDarkMode();
    }
  }

  void setLightMode() {
    currentTheme = ThemeData(
        primaryColor: lightPrimaryColor,
        scaffoldBackgroundColor: lightPrimaryColor,
        colorScheme: const ColorScheme.light()
            .copyWith(
              primary: lightPrimaryColor,
              secondary: lightSecondaryColor,
            )
            .copyWith(secondary: accentColor),
        appBarTheme: AppBarTheme(
            toolbarHeight: 80.0,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            titleTextStyle: TextStyle(
                fontFamily: 'Electrolize', fontSize: 35.0, color: black)),
        brightness: Brightness.light);
  }

  void setDarkMode() {
    currentTheme = ThemeData(
        primaryColor: darkPrimaryColor,
        scaffoldBackgroundColor: darkPrimaryColor,
        colorScheme: const ColorScheme.dark()
            .copyWith(
              primary: darkPrimaryColor,
              secondary: darkSecondaryColor,
            )
            .copyWith(secondary: accentColor),
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        appBarTheme: AppBarTheme(
            toolbarHeight: 80.0,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            titleTextStyle: TextStyle(
                fontFamily: 'Electrolize',
                fontSize: 35.0,
                color: HexColor("FFFFFF"))),
        brightness: Brightness.dark);
  }
}

ThemeProvider themeProvider = ThemeProvider();
