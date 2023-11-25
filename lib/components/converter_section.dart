import 'package:csci410_project1/components/input_section.dart';
import 'package:csci410_project1/components/output_section.dart';
import 'package:csci410_project1/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnitConverterBody extends StatefulWidget {
  const UnitConverterBody({super.key});

  @override
  State<UnitConverterBody> createState() => _UnitConverterBodyState();
}

class _UnitConverterBodyState extends State<UnitConverterBody> {
  bool isDarkMode = false;
  String inputUnit = 'meters';
  String outputUnit = 'kilometers';
  double inputValue = 0;
  double outputValue = 0;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InputSection(
              inputUnit: inputUnit,
              inputValue: inputValue,
              onInputUnitChanged: (newValue) {
                setState(() {
                  inputUnit = newValue!;
                  updateConversion();
                });
              },
              onInputValueChanged: (newValue) {
                setState(() {
                  inputValue = double.parse(newValue);
                  updateConversion();
                });
              },
            ),
            OutputSection(
              outputUnit: outputUnit,
              outputValue: outputValue,
              onOutputUnitChanged: (newValue) {
                setState(() {
                  outputUnit = newValue!;
                  updateConversion();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateConversion() {
    double conversionRate = getConversionRate(inputUnit, outputUnit);
    double result = inputValue * conversionRate;
    // Update output value
    setState(() {
      outputValue = result;
    });
  }

  double getConversionRate(String fromUnit, String toUnit) {
    if (fromUnit == 'meters' && toUnit == 'kilometers') {
      return 0.001; // 1 meter = 0.001 kilometers
    } else if (fromUnit == 'kilometers' && toUnit == 'meters') {
      return 1000.0; // 1 kilometer = 1000 meters
    } else if (fromUnit == 'meters' && toUnit == 'feet') {
      return 3.28084; // 1 meter = 3.28084 feet
    } else if (fromUnit == 'feet' && toUnit == 'meters') {
      return 0.3048; // 1 foot = 0.3048 meters
    } else if (fromUnit == 'meters' && toUnit == 'miles') {
      return 0.000621371; // 1 meter = 0.000621371 miles
    } else if (fromUnit == 'miles' && toUnit == 'meters') {
      return 1609.34; // 1 mile = 1609.34 meters
    } else if (fromUnit == 'kilometers' && toUnit == 'miles') {
      return 0.621371; // 1 kilometer = 0.621371 miles
    } else if (fromUnit == 'miles' && toUnit == 'kilometers') {
      return 1.60934; // 1 mile = 1.60934 kilometers
    } else if (fromUnit == 'feet' && toUnit == 'kilometers') {
      return 0.0003048; // 1 foot = 0.0003048 kilometers
    } else if (fromUnit == 'kilometers' && toUnit == 'feet') {
      return 3280.84; // 1 kilometer = 3280.84 feet
    } else if (fromUnit == 'miles' && toUnit == 'feet') {
      return 5280.0; // 1 mile = 5280 feet
    } else if (fromUnit == 'feet' && toUnit == 'miles') {
      return 0.000189394; // 1 foot = 0.000189394 miles
    } else if (fromUnit == 'millimeters' && toUnit == 'meters') {
      return 0.001; // 1 millimeter = 0.001 meters
    } else if (fromUnit == 'meters' && toUnit == 'millimeters') {
      return 1000.0; // 1 meter = 1000 millimeters
    } else if (fromUnit == 'millimeters' && toUnit == 'kilometers') {
      return 1e-6; // 1 millimeter = 1e-6 kilometers
    } else if (fromUnit == 'kilometers' && toUnit == 'millimeters') {
      return 1e6; // 1 kilometer = 1e6 millimeters
    } else if (fromUnit == 'millimeters' && toUnit == 'miles') {
      return 6.2137e-7; // 1 millimeter = 6.2137e-7 miles
    } else if (fromUnit == 'miles' && toUnit == 'millimeters') {
      return 1.60934e6; // 1 mile = 1.60934e6 millimeters
    } else if (fromUnit == 'millimeters' && toUnit == 'feet') {
      return 0.00328084; // 1 millimeter = 0.00328084 feet
    } else if (fromUnit == 'feet' && toUnit == 'millimeters') {
      return 304.8; // 1 foot = 304.8 millimeters
    } else {
      // If units are the same or conversion not defined, return 1 (no conversion)
      return 1.0;
    }
  }
}
