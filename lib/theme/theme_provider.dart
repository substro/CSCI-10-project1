import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? currentTheme;
  Color white = HexColor("FFFFFF");
  Color black = HexColor("000000");
  //this is the light theme background
  Color lightPrimaryColor = HexColor("F5F5F5");
  Color lightSecondaryColor = HexColor("FFFFFF");
  Color accentColor = HexColor("575DE3");
  // this is the dark theme background
  Color darkPrimaryColor = HexColor("030320");
  Color darkSecondaryColor = HexColor("1A2148");

  ThemeProvider() {
    final Brightness systemBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (systemBrightness == Brightness.light) {
      setDarkMode();
    } else {
      setLightMode();
    }
  }

  void setLightMode() {
    currentTheme = ThemeData(
      primaryColor: lightPrimaryColor,
      scaffoldBackgroundColor: lightPrimaryColor,
      colorScheme: const ColorScheme.light()
          .copyWith(
            inversePrimary: black,
            primary: darkPrimaryColor,
            secondary: lightSecondaryColor,
          )
          .copyWith(secondary: accentColor),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: white,
          ),
          toolbarHeight: 90.0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(
              fontFamily: 'Electrolize', fontSize: 40.0, color: black)),
      brightness: Brightness.light,
    );
    notifyListeners();
  }

  void setDarkMode() {
    currentTheme = ThemeData(
        primaryColor: darkPrimaryColor,
        scaffoldBackgroundColor: darkPrimaryColor,
        colorScheme: const ColorScheme.dark()
            .copyWith(
              inversePrimary: white,
              primary: darkPrimaryColor,
              secondary: darkSecondaryColor,
            )
            .copyWith(secondary: accentColor),
        cardColor: darkSecondaryColor,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: darkPrimaryColor, size: 25),
            toolbarHeight: 90.0,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            titleTextStyle: TextStyle(
                fontFamily: 'Electrolize', fontSize: 40.0, color: white)),
        brightness: Brightness.dark);
    notifyListeners();
  }
}
