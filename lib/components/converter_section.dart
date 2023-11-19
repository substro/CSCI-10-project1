import 'package:csci410_project1/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class UnitConverterBody extends StatefulWidget {
  const UnitConverterBody({super.key});

  @override
  State<UnitConverterBody> createState() => _UnitConverterBodyState();
}

class _UnitConverterBodyState extends State<UnitConverterBody> {
  var items = ["Item 1", "Item 2", "Item 3"];

  String selectedValue = "Item 1";
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(
      context,
      listen: false,
    );
    return Center(
      child: Container(
        width: screenWidth * 0.8,
        height: 300,
        decoration: BoxDecoration(
          color: isDarkMode
              ? themeProvider.darkSecondaryColor
              : themeProvider.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? themeProvider.white : const Color(0x1E000000),
              blurRadius: 47.30,
              spreadRadius: 5,
            )
          ],
        ),
      ),
    );
    // double screenWidth = MediaQuery.of(context).size.width;
  }
}
