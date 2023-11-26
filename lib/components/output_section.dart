import 'package:csci410_project1/data/menu_items.dart';
import 'package:csci410_project1/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class OutputSection extends StatelessWidget {
  final bool isDarkMode = false;
  final String outputUnit;
  final double outputValue;
  final Function(String?)? onOutputUnitChanged;

  const OutputSection({
    required this.outputUnit,
    required this.outputValue,
    required this.onOutputUnitChanged,
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
    final TextEditingController outputController = TextEditingController();
    outputController.text = outputValue.toString();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Output Unit:',
              style: TextStyle(color: themeProvider.white),
            ),
            const Gap(10),
            // TODO: move these items to a separate file and map them
            DropdownButton<String>(
              iconEnabledColor: themeProvider.white,
              style: TextStyle(color: themeProvider.white),
              dropdownColor: themeProvider.darkSecondaryColor,
              value: outputUnit,
              items: dropdownItems,
              onChanged: onOutputUnitChanged,
            ),
          ],
        ),
        const Gap(10),
        TextField(
          controller: TextEditingController(text: outputValue.toString()),
          readOnly: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxWidth: 250, maxHeight: 250),
            labelText: 'Output Value',
            labelStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: isDarkMode
                        ? themeProvider.accentColor
                        : themeProvider.white)),
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
