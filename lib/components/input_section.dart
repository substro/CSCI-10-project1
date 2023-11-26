import 'package:csci410_project1/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class InputSection extends StatelessWidget {
  final bool isDarkMode = false;
  final String inputUnit;
  final double inputValue;
  final Function(String?)? onInputUnitChanged;
  final Function(String) onInputValueChanged;

  const InputSection({
    required this.inputUnit,
    required this.inputValue,
    required this.onInputUnitChanged,
    required this.onInputValueChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(
      context,
      listen: false,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Input Unit:',
              style: TextStyle(color: themeProvider.white),
            ),
            const Gap(10),
            DropdownButton<String>(
              //!dropdown text color
              style: TextStyle(color: themeProvider.white),
              //!dropdown bg color
              dropdownColor: themeProvider.darkSecondaryColor,
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
                DropdownMenuItem<String>(
                  value: 'kilometers',
                  child: Text('Kilometers'),
                ),
                DropdownMenuItem<String>(
                  value: 'miles',
                  child: Text('Miles'),
                ),
                DropdownMenuItem<String>(
                  value: 'millimeters',
                  child: Text('Millimeters'),
                ),
                DropdownMenuItem<String>(
                  value: 'centimeters',
                  child: Text('Centimeters'),
                ),
                DropdownMenuItem<String>(
                  value: 'yards',
                  child: Text('Yards'),
                ),
                DropdownMenuItem<String>(
                  value: 'inches',
                  child: Text('Inches'),
                ),
                DropdownMenuItem<String>(
                  value: 'micrometers',
                  child: Text('Micrometers'),
                ),
                DropdownMenuItem<String>(
                  value: 'nanometers',
                  child: Text('Nanometers'),
                ),
              ],
              onChanged: onInputUnitChanged,
            ),
          ],
        ),
        const Gap(10),
        TextField(
          //!cursor color
          cursorColor: themeProvider.accentColor,
          keyboardType: TextInputType.number,
          onChanged: onInputValueChanged,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxWidth: 250, maxHeight: 250),
            labelText: 'Input Value',
            border: const OutlineInputBorder(),
            labelStyle: TextStyle(color: Colors.grey[500]),
            focusColor: Colors.red,
            //!border color
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeProvider.white,
              ),
            ),
            //!border color when focused
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeProvider.accentColor,
              ),
            ),
          ),
        ),
        const Gap(20),
      ],
    );
  }
}
