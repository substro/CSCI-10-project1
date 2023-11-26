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

  String capitalize(String s) {
    return s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
  }

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
            // TODO: move these items to a separate file and map them
            DropdownButton<String>(
              iconEnabledColor: themeProvider.white,
              style: TextStyle(color: themeProvider.white),
              dropdownColor: themeProvider.darkSecondaryColor,
              value: inputUnit,
              items: UnitConstants.map((unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(capitalize(unit)),
                );
              }).toList(),
              onChanged: onInputUnitChanged,
            ),
          ],
        ),
        const Gap(10),
        TextField(
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
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeProvider.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeProvider.accentColor),
            ),
          ),
        ),
        const Gap(20),
      ],
    );
  }
}
