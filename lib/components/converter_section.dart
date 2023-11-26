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
  String inputUnit = 'Meters';
  String outputUnit = 'Kilometers';
  double inputValue = 0;
  double outputValue = 0;

  final bool isDarkMode = false;
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
              ? themeProvider.white
              : themeProvider.darkSecondaryColor,
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
    } else if (fromUnit == 'centimeters' && toUnit == 'millimeters') {
      return 10.0; // 1 centimeter = 10 millimeters
    } else if (fromUnit == 'millimeters' && toUnit == 'centimeters') {
      return 0.1; // 1 millimeter = 0.1 centimeters
    } else if (fromUnit == 'centimeters' && toUnit == 'meters') {
      return 0.01; // 1 centimeter = 0.01 meters
    } else if (fromUnit == 'meters' && toUnit == 'centimeters') {
      return 100.0; // 1 meter = 100 centimeters
    } else if (fromUnit == 'centimeters' && toUnit == 'kilometers') {
      return 1e-5; // 1 centimeter = 1e-5 kilometers
    } else if (fromUnit == 'kilometers' && toUnit == 'centimeters') {
      return 1e5; // 1 kilometer = 1e5 centimeters
    } else if (fromUnit == 'centimeters' && toUnit == 'miles') {
      return 6.2137e-6; // 1 centimeter = 6.2137e-6 miles
    } else if (fromUnit == 'miles' && toUnit == 'centimeters') {
      return 1.60934e8; // 1 mile = 1.60934e8 centimeters
    } else if (fromUnit == 'centimeters' && toUnit == 'feet') {
      return 0.0328084; // 1 centimeter = 0.0328084 feet
    } else if (fromUnit == 'feet' && toUnit == 'centimeters') {
      return 30.48; // 1 foot = 30.48 centimeters
    } else if (fromUnit == 'yards' && toUnit == 'meters') {
      return 0.9144; // 1 yard = 0.9144 meters
    } else if (fromUnit == 'meters' && toUnit == 'yards') {
      return 1.09361; // 1 meter = 1.09361 yards
    } else if (fromUnit == 'yards' && toUnit == 'kilometers') {
      return 9.144e-4; // 1 yard = 9.144e-4 kilometers
    } else if (fromUnit == 'kilometers' && toUnit == 'yards') {
      return 1093.61; // 1 kilometer = 1093.61 yards
    } else if (fromUnit == 'yards' && toUnit == 'miles') {
      return 5.68182e-4; // 1 yard = 5.68182e-4 miles
    } else if (fromUnit == 'miles' && toUnit == 'yards') {
      return 1760.0; // 1 mile = 1760 yards
    } else if (fromUnit == 'yards' && toUnit == 'feet') {
      return 3.0; // 1 yard = 3 feet
    } else if (fromUnit == 'feet' && toUnit == 'yards') {
      return 0.333333; // 1 foot = 0.333333 yards
    } else if (fromUnit == 'yards' && toUnit == 'millimeters') {
      return 914.4; // 1 yard = 914.4 millimeters
    } else if (fromUnit == 'millimeters' && toUnit == 'yards') {
      return 1.09361e-3; // 1 millimeter = 1.09361e-3 yards
    } else if (fromUnit == 'yards' && toUnit == 'centimeters') {
      return 91.44; // 1 yard = 91.44 centimeters
    } else if (fromUnit == 'centimeters' && toUnit == 'yards') {
      return 0.0109361; // 1 centimeter = 0.0109361 yards
    } else if (fromUnit == 'inches' && toUnit == 'centimeters') {
      return 2.54; // 1 inch = 2.54 centimeters
    } else if (fromUnit == 'centimeters' && toUnit == 'inches') {
      return 0.393701; // 1 centimeter = 0.393701 inches
    } else if (fromUnit == 'inches' && toUnit == 'millimeters') {
      return 25.4; // 1 inch = 25.4 millimeters
    } else if (fromUnit == 'millimeters' && toUnit == 'inches') {
      return 0.0393701; // 1 millimeter = 0.0393701 inches
    } else if (fromUnit == 'inches' && toUnit == 'meters') {
      return 0.0254; // 1 inch = 0.0254 meters
    } else if (fromUnit == 'meters' && toUnit == 'inches') {
      return 39.3701; // 1 meter = 39.3701 inches
    } else if (fromUnit == 'inches' && toUnit == 'kilometers') {
      return 2.54e-5; // 1 inch = 2.54e-5 kilometers
    } else if (fromUnit == 'kilometers' && toUnit == 'inches') {
      return 39370.1; // 1 kilometer = 39370.1 inches
    } else if (fromUnit == 'inches' && toUnit == 'feet') {
      return 0.0833333; // 1 inch = 0.0833333 feet
    } else if (fromUnit == 'feet' && toUnit == 'inches') {
      return 12.0; // 1 foot = 12 inches
    } else if (fromUnit == 'inches' && toUnit == 'miles') {
      return 1.5783e-5; // 1 inch = 1.5783e-5 miles
    } else if (fromUnit == 'miles' && toUnit == 'inches') {
      return 63360.0; // 1 mile = 63360 inches
    } else if (fromUnit == 'inches' && toUnit == 'yards') {
      return 0.0277778; // 1 inch = 0.0277778 yards
    } else if (fromUnit == 'yards' && toUnit == 'inches') {
      return 36.0; // 1 yard = 36 inches
    } else if (fromUnit == 'micrometers' && toUnit == 'millimeters') {
      return 0.001; // 1 micrometer = 0.001 millimeters
    } else if (fromUnit == 'millimeters' && toUnit == 'micrometers') {
      return 1000.0; // 1 millimeter = 1000 micrometers
    } else if (fromUnit == 'micrometers' && toUnit == 'centimeters') {
      return 0.0001; // 1 micrometer = 0.0001 centimeters
    } else if (fromUnit == 'centimeters' && toUnit == 'micrometers') {
      return 10000.0; // 1 centimeter = 10000 micrometers
    } else if (fromUnit == 'micrometers' && toUnit == 'meters') {
      return 1e-6; // 1 micrometer = 1e-6 meters
    } else if (fromUnit == 'meters' && toUnit == 'micrometers') {
      return 1e6; // 1 meter = 1e6 micrometers
    } else if (fromUnit == 'micrometers' && toUnit == 'kilometers') {
      return 1e-9; // 1 micrometer = 1e-9 kilometers
    } else if (fromUnit == 'kilometers' && toUnit == 'micrometers') {
      return 1e9; // 1 kilometer = 1e9 micrometers
    } else if (fromUnit == 'micrometers' && toUnit == 'feet') {
      return 3.28084e-6; // 1 micrometer = 3.28084e-6 feet
    } else if (fromUnit == 'feet' && toUnit == 'micrometers') {
      return 304800.0; // 1 foot = 304800 micrometers
    } else if (fromUnit == 'micrometers' && toUnit == 'miles') {
      return 6.2137e-13; // 1 micrometer = 6.2137e-13 miles
    } else if (fromUnit == 'miles' && toUnit == 'micrometers') {
      return 1.60934e12; // 1 mile = 1.60934e12 micrometers
    } else if (fromUnit == 'micrometers' && toUnit == 'inches') {
      return 3.93701e-5; // 1 micrometer = 3.93701e-5 inches
    } else if (fromUnit == 'inches' && toUnit == 'micrometers') {
      return 25400.0; // 1 inch = 25400 micrometers
    } else if (fromUnit == 'micrometers' && toUnit == 'yards') {
      return 1.09361e-6; // 1 micrometer = 1.09361e-6 yards
    } else if (fromUnit == 'yards' && toUnit == 'micrometers') {
      return 914400.0; // 1 yard = 914400 micrometers
    } else if (fromUnit == 'nanometers' && toUnit == 'micrometers') {
      return 0.001; // 1 nanometer = 0.001 micrometers
    } else if (fromUnit == 'micrometers' && toUnit == 'nanometers') {
      return 1000.0; // 1 micrometer = 1000 nanometers
    } else if (fromUnit == 'nanometers' && toUnit == 'millimeters') {
      return 0.000001; // 1 nanometer = 0.000001 millimeters
    } else if (fromUnit == 'millimeters' && toUnit == 'nanometers') {
      return 1000000.0; // 1 millimeter = 1000000 nanometers
    } else if (fromUnit == 'nanometers' && toUnit == 'centimeters') {
      return 1e-7; // 1 nanometer = 1e-7 centimeters
    } else if (fromUnit == 'centimeters' && toUnit == 'nanometers') {
      return 1e7; // 1 centimeter = 1e7 nanometers
    } else if (fromUnit == 'nanometers' && toUnit == 'meters') {
      return 1e-9; // 1 nanometer = 1e-9 meters
    } else if (fromUnit == 'meters' && toUnit == 'nanometers') {
      return 1e9; // 1 meter = 1e9 nanometers
    } else if (fromUnit == 'nanometers' && toUnit == 'kilometers') {
      return 1e-12; // 1 nanometer = 1e-12 kilometers
    } else if (fromUnit == 'kilometers' && toUnit == 'nanometers') {
      return 1e12; // 1 kilometer = 1e12 nanometers
    } else if (fromUnit == 'nanometers' && toUnit == 'feet') {
      return 3.28084e-9; // 1 nanometer = 3.28084e-9 feet
    } else if (fromUnit == 'feet' && toUnit == 'nanometers') {
      return 3.048e8; // 1 foot = 3.048e8 nanometers
    } else if (fromUnit == 'nanometers' && toUnit == 'miles') {
      return 6.2137e-13; // 1 nanometer = 6.2137e-13 miles
    } else if (fromUnit == 'miles' && toUnit == 'nanometers') {
      return 1.60934e13; // 1 mile = 1.60934e13 nanometers
    } else if (fromUnit == 'nanometers' && toUnit == 'inches') {
      return 3.93701e-8; // 1 nanometer = 3.93701e-8 inches
    } else if (fromUnit == 'inches' && toUnit == 'nanometers') {
      return 2.54e7; // 1 inch = 2.54e7 nanometers
    } else if (fromUnit == 'nanometers' && toUnit == 'yards') {
      return 1.09361e-12; // 1 nanometer = 1.09361e-12 yards
    } else if (fromUnit == 'yards' && toUnit == 'nanometers') {
      return 9.144e11; // 1 yard = 9.144e11 nanometers
    } else {
      // If units are the same or conversion not defined, return 1 (no conversion)
      return 1.0;
    }
  }
}
