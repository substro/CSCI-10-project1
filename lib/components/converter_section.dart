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
            // Add dropdown for input unit
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Input Unit:'),
                const Gap(10),
                DropdownButton<String>(
                  value: inputUnit,
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'meters',
                      child: Text('Meters'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'feet',
                      child: Text('Feet'),
                    ),
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      inputUnit = newValue!;
                      updateConversion();
                    });
                  },
                ),
              ],
            ),

            // Add text field for input value
            TextField(
              onChanged: (newValue) {
                setState(() {
                  inputValue = double.tryParse(newValue) ?? 0;
                  // updateConversion();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Input Value',
                border: OutlineInputBorder(),
              ),
            ),

            // Add dropdown for output unit
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Output Unit:'),
                const Gap(10),
                DropdownButton<String>(
                  value: outputUnit,
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'kilometers',
                      child: Text('Kilometers'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'miles',
                      child: Text('Miles'),
                    ),
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      outputUnit = newValue!;
                      // updateConversion();
                    });
                  },
                ),
              ],
            ),

            // Add text field for output value
            TextField(
              controller: TextEditingController(text: outputValue.toString()),
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Output Value',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateConversion() {
    // Implement conversion logic based on inputUnit, inputValue, and outputUnit
    // Update outputValue based on the conversion result
  }
}
