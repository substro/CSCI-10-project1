import 'package:csci410_project1/components/input_section.dart';
import 'package:csci410_project1/components/output_section.dart';
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
                  // TODO:Implement the logic related to input unit change
                });
              },
              onInputValueChanged: (newValue) {
                setState(() {
                  inputUnit = newValue;
                  // TODO:Implement the logic related to input value change
                });
              },
            ),
            OutputSection(
              outputUnit: outputUnit,
              outputValue: outputValue,
              onOutputUnitChanged: (newValue) {
                setState(() {
                  outputUnit = newValue!;
                  // TODO:Implement the logic related to input unit change
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateConversion() {
    // TODO: Implement conversion logic based on inputUnit, inputValue, and outputUnit
    // TODO: Update outputValue based on the conversion result
  }
}
